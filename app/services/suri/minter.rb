# frozen_string_literal: true

require 'errors'

module Suri
  # Create a NOID like minter service for DRUIDs via SURI
  class Minter
    def mint
      retrieve_druid
    end

    private

    def valid_druid?
      druid.match?(/\A([a-z]{2})(\d{3})([a-z]{2})(\d{4})\z/i)
    end

    def retrieve_druid
      return druid if valid_druid?
      raise Hydrox::SuriInvalidDruidReturned, "Invalid druid: #{druid}"
    end

    def druid
      @druid ||= connection.response
    end

    def connection
      @connection ||= Suri::Connection.new
    end
  end
end
