###
#  Simple controller to handle login and redirect
###
class LoginController < ApplicationController
  def login
    # Set eds_guest to nil so the EDS session gets reset if needed in the article controller
    session['suAffiliation'] = request.env['suAffiliation'] || ENV['suAffiliation']

    if params[:referrer].present?
      redirect_to params[:referrer]
    else
      redirect_back fallback_location: root_url
    end
  end
end
