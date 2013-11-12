class SessionsController < ApplicationController
  skip_before_filter :require_login
  
  respond_to :html, :only => [:create, :new]
  
  def new
    if logged_in?
      redirect_to welcome_path
    else
      @user = User.new
    end
  end
  
  def create
    user = User.find_by_email(params[:login]) || User.find_by_username(params[:login])
    if user && user.authenticate(params[:password])
      log_in(user)
      redirect_to welcome_path
    else
      redirect_to login_path, :notice => "The username and password you provided did not match."
    end
  end
  
  def destroy
    log_out(current_user)
    render json: {}
  end
  
end
