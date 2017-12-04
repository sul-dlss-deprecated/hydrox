# frozen_string_literal: true

# A custom exceptions class to provide specific Hydrox::Exceptions
module Hydrox
  # A Timeout error raised when the connection to SURI timesout
  class SuriTimeoutError < StandardError; end

  class SuriAuthenticationError < StandardError; end

  class SuriException < StandardError; end

  class SuriInvalidDruidReturned < StandardError; end
end
