class ApplicationController < ActionController::Base
  protect_from_forgery
  #before_filter :session_user_exists
  before_filter :require_login
  helper_method :current_user
  helper_method :logged_in
  helper_method :log_in
  helper_method :log_out

  before_filter :weaken_params


  def require_admin
    if logged_in? && !current_user.is_admin?
      redirect_to logout_path, error: "You must be an admin in to access this section!"
    end
  end
  
  def log_in(user)
    session[:user_id] = user.try(:id)
  end
  
  def log_out(user)
    @current_user = nil
    session[:user_id] = nil
  end
  
  def require_login
    unless logged_in?
      reset_session
      redirect_to login_path, error: "You must be logged in to access this section, hombre."
    end
  end
  
  def session_user_exists
    unless session[:user_id] && User.find_by_id(session[:user_id]).present?
      reset_session
      redirect_to '/'
    end
  end

  def current_user 
    @current_user ||= User.find_by_id(session[:user_id]) if session[:user_id] || nil
  end
  
  def logged_in?
    !!current_user
  end
  
  helper :all  
  private
  
  def weaken_params
    params.permit!
  end
  
end

