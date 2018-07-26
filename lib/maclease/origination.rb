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
    @encoded_authorisation = Base64.encode64("#{@consumer_key}:#{@consumer_secret}").strip
  end

  def get_quote(data)
    originate("/quotes", data)
  end

  def create_application(data)
    originate("/applications", data)
  end

  def upload_document(data)
    originate("/documents", data)
  end

  def originate(endpoint, data)
    post(Maclease.configuration.url + endpoint, data.to_hash)
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
      url = "#{Maclease.configuration.url}/oauth20/token"
      data = { scope: 'leasing', grant_type: "client_credentials" }
      response = external_connection(url).post do |req|
        req.headers['Content-Type'] = 'application/json'
        req.headers['Accept-Encoding'] = 'gzip, deflate'
        req.headers['Authorization'] = "Basic #{@encoded_authorisation}"
        req.body = data.to_json
      end
      result = JSON.parse(response.body)

      if(result['error'])
        http_rescue(result)
      end

      result["access_token"]
    rescue ::JSON::ParserError => e
      json_rescue(e, response)
    rescue ::Faraday::ClientError => e
      http_rescue(e)
    end
  end


  def external_connection(url)
    Faraday.new(url: URI("#{url}"), ssl: { verify: false } ) do |faraday|
      faraday.request  :url_encoded
      faraday.response :logger
      faraday.adapter  Faraday.default_adapter
    end
  end

  def http_rescue(error)
    raise Maclease::ServerError.new(error.response), error.message
  end

  def json_rescue(error, response)
    raise Maclease::ServerError.new(response) , "Invalid result data. Could not parse JSON response body \n #{error.message}"
  end
end

