class CreateChatMessages < ActiveRecord::Migration
  def change
    create_table :chat_messages do |t|
    	t.text     		:body
    	t.text     		:meta
    	t.integer  		:user_id
    	t.integer  		:event_stream_id
      t.timestamps
    end
  end
end
