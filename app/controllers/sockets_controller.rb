class SocketsController < ApplicationController
	skip_before_filter :require_login
  
  include Tubesock::Hijack

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
		          tubesock.send_data message
		        end
		      end
		    elsif @listening && event_stream_data['chat_message']
		      chat_message = ChatMessage.new(event_stream_data['chat_message'])
          chat_message.user_id = current_user.id
		      chat_message.meta = process_meta_data(chat_message) if chat_message.meta.present?
		      chat_message.save
		    end
		  end
		  tubesock.onclose do
		    @listening = false
		    @listener.join
		  end
		end
	end

    def demo
    @listening = false
    hijack do |tubesock|
      tubesock.onmessage do |data|
        tubesock.send_data "foooooooooo"
      end
    end
  end

	private
  
  def process_meta_data(message)
    meta_data = message.meta
    action_key = META_CONTROLLER_KEYS.map {|key| meta_data.has_key?(key) ? key : nil }.compact[0]
    case action_key
    when 'diceRoll'
      Dice.humanized_roll(meta_data[action_key])
    when 'ssh'
      output = %x[#{message.body} | tail -20]
      output.split("\n").map{|line| '<p>'+line+'</p>'}.join('') if output
    end
  end
  
  META_CONTROLLER_KEYS = ['diceRoll', 'ssh']

end