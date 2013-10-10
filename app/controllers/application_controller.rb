class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :weaken_params
  
  private
  
  def weaken_params
    params.permit!
  end
end
