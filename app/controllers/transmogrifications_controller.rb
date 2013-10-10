class TransmogrificationsController < ApplicationController
  respond_to :json
  
  def index
    @transmogrifications = Transmogrification.all
    respond_with @transmogrifications
  end
  
  def create
    respond_with @transmogrification= Transmogrification.create(params[:transmogrification])
  end
  
  def update
    @transmogrification = Transmogrification.find_by_id(params[:id])
    @transmogrification.update_attributes(params[:transmogrification])
    respond_with @transmogrification
  end
  
end