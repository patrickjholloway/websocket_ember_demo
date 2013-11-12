class EventStreamsController < ApplicationController
  respond_to :json
  skip_before_filter :require_login
  before_filter :weaken_params
  
  include Tubesock::Hijack
  
  def index
    respond_with EventStream.all
  end
  
  def create
    respond_with EventStream.create(params[:event_stream])
  end
  
  def update
    respond_with EventStream.update(params[:id], params[:event_stream])
  end
  
  def destroy
    respond_with EventStream.destroy(params[:id])
  end
  
  def show
    respond_with EventStream.find(params[:id])
  end
  
  def chat
    @listening = false
    hijack do |tubesock|
      tubesock.onmessage do |data|
        event_stream_data = JSON.parse(data)
        if event_stream_data['event_stream'] && !@listening
          es = EventStream.find event_stream_data['event_stream']['id']
          @listening = true
          @listener = Thread.new do
            Thread.current.abort_on_exception = true
            es.on_new_message do |message|
              tubesock.send_data JSON.parse(message)
            end
          end
        elsif @listening && event_stream_data['chat_message']
          chat_message = ChatMessage.new(event_stream_data['chat_message'])
          chat_message.meta = process_meta_data(chat_message) if chat_message.meta.present?
          event_stream = EventStream.find(chat_message.event_stream_id)
          campaign = event_stream.campaign
          if current_user.is_game_master_of?(campaign)
            chat_message.game_master = true
          else
            chat_message.character_id = Character.where(user_id: current_user.id, campaign_id: event_stream.campaign_id).first.id
          end
          chat_message.save
        end
      end
      tubesock.onclose do
        @listening = false
        @listener.join
      end
    end
  end
  
  private
  
  def process_meta_data(message)
    meta_data = JSON.parse(message.meta)
    action_key = META_CONTROLLER_KEYS.map {|key| meta_data.has_key?(key) ? key : nil }.compact[0]
    result = case action_key
    when 'diceRoll'
      Dice.humanized_roll(meta_data[action_key])
    end
    result.to_json
  end
  
  META_CONTROLLER_KEYS = ['diceRoll']
    
    def weaken_params
      params.permit!
    end
  
end
