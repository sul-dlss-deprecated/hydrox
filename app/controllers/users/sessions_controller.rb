class Users::SessionsController < Devise::SessionsController
  def new
    if Settings.require_shib_user_authn
      store_location_for(:user, '/dashboard')
      redirect_to user_shibboleth_omniauth_authorize_path
    else
      super
    end
  end

  def after_sign_out_path_for(scope)
    return Settings.sso_logout_url if Settings.require_shib_user_authn
    super
  end
end
