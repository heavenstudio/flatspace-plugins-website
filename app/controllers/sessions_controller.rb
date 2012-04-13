class SessionsController < ApplicationController
  skip_before_filter :set_referer
  
  def create
    auth = request.env["omniauth.auth"]
    user = User.find_by_facebook_id(auth["uid"]) || User.create_with_omniauth(auth)
    session[:user_id] = user.to_param
    redirect_to session[:return_to][-1], notice: "Signed in!"
  end
  
  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: "Signed out!"
  end
end
