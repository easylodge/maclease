require "base64"
require 'faraday'
require 'json'
require 'active_support'
require 'active_support/core_ext'

class InterfiCapital::Origination
  def initialize(api_key=nil, consumer_key=nil, consumer_secret=nil)
    @api_key = api_key || ENV['INTERFI_CAPITAL_API_KEY']
    @consumer_key = consumer_key || ENV['MACLEASE_CONSUMER_KEY']
    @consumer_secret = consumer_secret || ENV['MACLEASE_CONSUMER_SECRET']
    encode_authentication
  end

  def encode_authentication
    valid_credentials?
    @encoded_authorisation = Base64.encode64("#{@consumer_key}:#{@consumer_secret}").strip
    @encoded_api_key = Base64.encode64(@api_key).strip
  end

  def get_quote(data)
    originate(data)
  end

  def create_application(data)
    originate(data)
  end

  def originate(data)
    post(InterfiCapital.configuration.url, data.to_hash)
  end

  private

  def post(url, data = {})
    result = nil
    response = nil
    begin
      response = post_connection(url).post do |req|
        req.headers['Content-Type'] = 'application/json'
        req.headers['Accept'] = 'application/json'
        req.headers['Authorization'] = "Basic #{@encoded_authorisation}"
        req.headers['X-Interfi-Authorisation'] = @encoded_api_key
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
    raise Maclease::ValidationError.new("Please provide API key!") unless @api_key.present?
    raise Maclease::ValidationError.new("Please provide Username!") unless @username.present?
    raise Maclease::ValidationError.new("Please provide Password!") unless @password.present?
    true
  end

  def post_connection(url)
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

