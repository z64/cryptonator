require "json"

module Cryptonator
  # :nodoc:
  module FloatConverter
    def self.from_json(parser)
      Float64.new parser.read_string
    end
  end

  struct Ticker
    JSON.mapping(
      base: String,
      target: String,
      price: {type: Float64, converter: FloatConverter},
      volume: {type: Float64, converter: FloatConverter},
      change: {type: Float64, converter: FloatConverter},
      markets: {type: Array(Market), default: [] of Market}
    )
  end

  struct Market
    JSON.mapping(
      market: String,
      price: {type: Float64, converter: FloatConverter},
      volume: {type: Float64}
    )
  end

  struct Currency
    JSON.mapping(
      name: String,
      code: String,
      statuses: Array(String)
    )
  end

  # :nodoc:
  struct APIError
    JSON.mapping(message: {type: String?, key: "error"}, success: Bool?)
  end
end
