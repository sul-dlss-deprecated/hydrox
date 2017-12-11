# frozen_string_literal: true

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :shibboleth, request_type: :header
end
