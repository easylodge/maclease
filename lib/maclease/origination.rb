require "base64"
require 'faraday'
require 'json'
require 'active_support'
require 'active_support/core_ext'

class Maclease::Origination
  def initialize(consumer_key=nil, consumer_secret=nil)
    @consumer_key = consumer_key || Maclease.configuration.consumer_key
    @consumer_secret = consumer_secret || Maclease.configuration.consumer_secret
    encode_authentication
  end

  def encode_authentication
    valid_credentials?
    @encoded_authorisation = Base64.encode64("#{@consumer_key}:#{@consumer_secret}").gsub("\n", '').strip
  end

  def get_vehicle_guide
    retrieve("#{Maclease::REQUEST_BASE_URL}/vehicle_guide/years")
  end

  def get_quote(data)
    originate("#{Maclease::REQUEST_BASE_URL}/quotes", data)
  end

  def create_application(data)
    originate("#{Maclease::REQUEST_BASE_URL}/applications", data)
  end

  def upload_document(data)
    originate("#{Maclease::REQUEST_BASE_URL}/documents", data)
  end

  def originate(endpoint, data)
    post(Maclease.configuration.url + endpoint, data.to_hash)
  end

  def retrieve(endpoint)
    get(Maclease.configuration.url + endpoint)
  end

  private

  def post(url, data = {})
    result = nil
    response = nil
    begin
      response = external_connection(url).post do |req|
        req.headers['Content-Type'] = 'application/json'
        req.headers['Accept-Encoding'] = 'gzip, deflate'
        req.headers['Authorization'] = "Bearer #{authorization_token}"
        req.headers['access_token'] = '612-8d114908eb48'
        req.body = data.to_json
      end

      result = ::JSON.parse(response.body)
    rescue ::JSON::ParserError => e
      json_rescue(e, response)
    rescue ::Faraday::ClientError => e
      http_rescue(e)
    end

    return result
  end

  def valid_credentials?
    raise Maclease::ValidationError.new("Please provide Consumer Key!") unless @consumer_key.present?
    raise Maclease::ValidationError.new("Please provide Consumer Secret!") unless @consumer_secret.present?
    true
  end

  def authorization_token
    result = nil
    response = nil
    begin
      url = "#{Maclease.configuration.url}#{Maclease::AUTH_BASE_URL}/oauth20/token"
      response = external_connection(url).post do |req|
        req.headers['Content-Type'] = 'application/json'
        req.headers['Accept-Encoding'] = 'gzip, deflate'
        req.headers['Authorization'] = "Basic #{@encoded_authorisation}"
        req.params = { scope: 'leasing', grant_type: "client_credentials" }
      end
      result = JSON.parse(response.body)

      if(result['error'])
        http_rescue(result)
      end

      result['access_token']
    rescue ::JSON::ParserError => e
      json_rescue(e, response)
    rescue ::Faraday::ClientError => e
      http_rescue(e)
    end
  end

  def get(url)
    result = nil
    response = nil
    begin
      response = external_connection(url).get do |req|
        req.headers['Content-Type'] = 'application/json'
        req.headers['Accept-Encoding'] = 'gzip, deflate'
        req.headers['Authorization'] = "Bearer #{authorization_token}"
      end

      result = ::JSON.parse(response.body)
    rescue ::JSON::ParserError => e
      json_rescue(e, response)
    rescue ::Faraday::ClientError => e
      http_rescue(e)
    end

    return result
  end


  def external_connection(url)
    Faraday.new(url: URI("#{url}"), ssl: { verify: false } ) do |faraday|
      faraday.request  :url_encoded
      faraday.response :logger
      faraday.adapter  Faraday.default_adapter
    end
  end

  def http_rescue(error)
    raise Maclease::ServerError.new(error["error"]), error["message"], error["code"]
  end

  def json_rescue(error, response)
    raise Maclease::ServerError.new(response) , "Invalid result data. Could not parse JSON response body \n #{error.message}"
  end
end

