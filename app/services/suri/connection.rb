# frozen_string_literal: true

require 'net/http'
require 'uri'
require 'errors'

module Suri
  # Establishes the connection to SURI and returns the requested DRUID on success
  class Connection
    def response
      authenticate_suri
      enable_ssl
      return suri_response.body.strip if valid_response?
      raise_connection_error
    end

    private

    def valid_response?
      suri_response.code == '201'
    end

    def suri_response
      @suri_response ||= suri_connection.request(suri_request)
    rescue Net::OpenTimeout
      raise Hydrox::SuriTimeoutError, "The connection to #{Settings.suri.service_url} has timed out."
    end

    def suri_connection
      @suri_connection ||= Net::HTTP.new(suri_uri.host, suri_uri.port)
    end

    def enable_ssl
      suri_connection.use_ssl = Settings.suri.use_ssl
    end

    def suri_uri
      @suri_uri ||= URI.parse(Settings.suri.service_url)
    end

    def suri_request
      @suri_request ||= Net::HTTP::Post.new(suri_uri.request_uri)
    end

    def authenticate_suri
      suri_request.basic_auth(Settings.suri.username, Settings.suri.password)
    end

    def raise_connection_error
      case suri_response.code
      when '401'
        raise Hydrox::SuriAuthenticationError, 'Incorrect username/password provided to SURI.'
      else
        raise Hydrox::SuriException, "An error occured communicating with SURI. #{response.code}: #{response.body}"
      end
    end
  end
end
