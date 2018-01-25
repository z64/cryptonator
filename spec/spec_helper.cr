require "spec"
require "../src/cryptonator"

# Helper to read a file from the subject data directory
def data(filename)
  File.read("#{Dir.current}/spec/data/#{filename}")
end
