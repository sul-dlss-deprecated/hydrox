require 'net/http'
require 'uri'
require 'errors'

class SuriMinter < ActiveFedora::Noid::Minter::Base

  protected

  def next_id
    retrieve_id
  end

  private

  def retrieve_id
    suri_request.basic_auth(Settings.suri.username, Settings.suri.password)
    suri_connection.use_ssl = true
    handle_response(suri_connection.request(suri_request))
  rescue Net::OpenTimeout => err
    raise Hydrox::SuriTimeoutError, "The connection to SURI has timed out."
  end

  def suri_connection
    @suri_connection ||=  Net::HTTP.new(suri_uri.host, suri_uri.port)
  end

  def suri_uri
    @uri ||= URI.parse(Settings.suri.service_url)
  end

  def suri_request
    @suri_request ||= Net::HTTP::Post.new(suri_uri.request_uri)
  end

  def handle_response(response)
    case response.code
    when "201"
      response.body.strip
    when "401"
      raise Hydrox::SutiAuthenticationError, "Incorrect username/password provided to SURI."
    else
      raise Hydrox::SuriException, "An error occured communicating with SURI. #{response.code}: #{response.body}"
    end
  end
end
