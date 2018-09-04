module Maclease
  class Configuration
    attr_accessor :url, :consumer_key, :consumer_secret, :api_key

    def initialize(args = {})
      @url = args[:url] || ENV['MACLEASE_URL']
      @consumer_key = args[:consumer_key] || ENV['MACLEASE_CONSUMER_KEY']
      @consumer_secret = args[:consumer_secret] || ENV['MACLEASE_CONSUMER_SECRET']
      @api_key = args[:api_key] || ENV['MACLEASE_PARTNER_API_KEY']
    end
  end
end
