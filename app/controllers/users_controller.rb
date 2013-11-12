class UsersController < ApplicationController
  skip_before_filter :require_login, only: [:create, :update]

  layout "ember", :except => [ "new", "confirm" ]
  respond_to :json, :only => [:index,:show, :current]
  before_filter :find_user, :only => [:show, :current]
  before_filter :weaken_params
  
  def show
    q = params[:id]
    @user = User.find(params[:id])
    respond_with @user.ember_json.target!
  end
  
  def current
    respond_with current_user.ember_json.target!
  end

  def new
    @user = User.new
  end
  
  def index
    find_users
    respond_with @users
  end
  
  def create
    if user = User.create(params[:user])
      session[:user_id] = user.id
      redirect_to welcome_path, :notice => "Logged in!"
    else
      redirect_to root_path, :notice => "Attempt to sign up failed"
    end
  end

  def update
    @user = User.find(params[:id])
    
    
    if @user.update_attributes(params[:user])
      if !session[:user_id]
        redirect_to login_path, :notice => 'Password was successfully updated.'
      else
        redirect_to user_path, :notice => 'User was successfully updated.'
      end
    else
      render action: "edit"
    end
  end

  private

  def find_users
    @users = User.find(params[:ids])
  end

  def find_users
    @user = User.find(params[:id])
  end
end
