require "http/client"
require "./cryptonator/*"

module Cryptonator
  BASE_URL = "https://api.cryptonator.com/api"

  class Client
    private def request(endpoint : String)
      response = HTTP::Client.get("#{BASE_URL}/#{endpoint}")
      handle_error(response)
      response.body
    end

    private def handle_error(response : HTTP::Client::Response)
      error = APIError.from_json(response.body)
      raise Exception.new(response, error) unless error.success
    rescue JSON::ParseException
      raise Exception.new(response)
    end

    # Returns a list of currencies tracked by Cryptonator
    def currencies
      response = request "currencies"
      Array(Currency).from_json(response, "rows")
    end

    # Returns the ticker for the given code
    def ticker(base : String, target : String)
      response = request "ticker/#{base}-#{target}"
      Ticker.from_json(response, "ticker")
    end

    # Returns the ticker for the given code, with additional market data
    def ticker_with_markets(base : String, target : String)
      response = request "full/#{base}-#{target}"
      Ticker.from_json(response, "ticker")
    end
  end

  INSTANCE = Client.new

  # See `Client#currencies`
  def self.currencies
    INSTANCE.currencies
  end

  # See `Client#ticker`
  def self.ticker(base, code)
    INSTANCE.ticker(base, code)
  end

  # See `Client#ticker_with_markets`
  def self.ticker_with_markets(base, code)
    INSTANCE.ticker_with_markets(base, code)
  end
end
