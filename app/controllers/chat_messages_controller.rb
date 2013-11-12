class ChatMessagesController < ApplicationController
  respond_to :json
  before_filter :weaken_params
  
  def index
    if params[:ids].present?
      respond_with ChatMessage.find_by_ids(params[:ids])
    else
      respond_with ChatMessage.all
    end
  end
  
  def update
    respond_with ChatMessage.update(params[:id], params[:chat_message])
  end
  
  def destroy
    respond_with ChatMessage.destroy(params[:id])
  end
  
  def show
    respond_with ChatMessage.find(params[:id])
  end
end
