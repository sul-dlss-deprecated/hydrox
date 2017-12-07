class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def shibboleth
    user = resource_class.from_omniauth(request.env["omniauth.auth"])
    sign_in_and_redirect user
  end
end
