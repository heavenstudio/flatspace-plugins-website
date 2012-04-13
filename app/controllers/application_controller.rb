class ApplicationController < ActionController::Base
  before_filter :set_referer
  protect_from_forgery
  helper_method :current_user, :user_signed_in?
  
  private
    def user_signed_in?
      !!session[:user_id]
    end
  
    def current_user
      @current_user ||= User.find(session[:user_id]) if user_signed_in?
    end
    
    def authenticate_user!
      redirect_to '/auth/facebook' unless user_signed_in?
    end
    
    def set_referer
      session[:return_to] ||= []
      session[:return_to] << request.path
      session[:return_to].shift if session[:return_to].size > 5
    end
end
