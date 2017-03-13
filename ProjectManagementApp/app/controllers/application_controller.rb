class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :set_cache_buster
  helper_method :current_user
  before_filter :require_login
 
  
  private

  def require_login
    unless current_user
      redirect_to root_url
    end
  end
	
  def current_user
	  @current_user ||= User.find_by_id(session[:user_id]) if session[:user_id]
	  @current_user
  end
  
  def set_cache_buster     
    expires_now()	
    response.headers["Cache-Control"] = "no-cache, max-age=0, no-store, must-revalidate" 
	response.headers["Pragma"] = "no-cache" 
	response.headers["Expires"] = "0"
  end
end
