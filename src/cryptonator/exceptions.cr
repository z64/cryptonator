module Cryptonator
  class Exception < ::Exception
    getter response : HTTP::Client::Response
    getter error : APIError?

    def initialize(@response : HTTP::Client::Response)
    end

    def initialize(@response : HTTP::Client::Response, @error : APIError)
    end

    delegate status_code, status_message, to: @response

    def message
      "#{status_code} #{status_message} (#{error.try &.message})"
    end

    def to_s(io)
      io << status_code << ' ' << status_message << " (" << error.try(&.message) << ')'
    end
  end
end
