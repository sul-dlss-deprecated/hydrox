# A custom exceptions class to provide specific Hydrox::Exceptions
module Hydrox
  # A Timeout error raised when the connection to SURI timesout
  class SuriTimeoutError < StandardError; end

  class SutiAuthenticationError < StandardError; end

  class SuriException < StandardError; end
end
