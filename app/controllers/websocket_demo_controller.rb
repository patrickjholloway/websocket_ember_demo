class WebsocketDemoController < ApplicationController
  layout "ember"
  
  def index
    redirect_to login_path unless logged_in?
  end
end