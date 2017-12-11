Rails.application.config.middleware.use OmniAuth::Builder do
  provider :shibboleth, request_type: :header
end
