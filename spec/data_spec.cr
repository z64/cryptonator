require "./spec_helper"

def it_parses(klass, using file, under key)
  it "parses #{klass} with #{key} in #{file}" do
    json = data(file)
    klass.from_json(json, key).should be_truthy
  end
end

describe Cryptonator::Ticker do
  it_parses(Cryptonator::Ticker, using: "ticker.json", under: "ticker")
  it_parses(Cryptonator::Ticker, using: "ticker.json", under: "ticker")
end

describe Cryptonator::Currency do
  it_parses(Array(Cryptonator::Currency), using: "currencies.json", under: "rows")
end
