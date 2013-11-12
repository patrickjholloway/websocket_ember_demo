class EventStream < ActiveRecord::Base
  has_many :chat_messages
    
  def on_new_message
    db_connection.execute "LISTEN #{channel}"
    loop do
      db_connection.raw_connection.wait_for_notify do |event, pid, chat_message|
        yield chat_message
      end
    end
  ensure
    db_connection.execute "UNLISTEN #{channel}"
  end

  private
  
  def db_connection
    self.class.connection
  end
  
  def channel
    "eventsteam_#{id}"
  end
end