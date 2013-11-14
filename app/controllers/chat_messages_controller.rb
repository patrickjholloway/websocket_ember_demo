class ChatMessagesController < ApplicationController
  respond_to :json
  before_filter :weaken_params
  
  def index
    if params[:ids].present?
      render json: @chat_messages = ChatMessage.find_by_ids(params[:ids])
    else
      render json: @chat_messages = ChatMessage.all
    end
  end
  
  def update
    respond_with ChatMessage.update(params[:id], params[:chat_message])
  end
  
  def destroy
    respond_with ChatMessage.destroy(params[:id])
  end
  
  def show
    @chat_message = ChatMessage.find(params[:id])
    render action: 'show'
  end
end
