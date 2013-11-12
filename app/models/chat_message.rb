class ChatMessage < ActiveRecord::Base
  belongs_to :user
  belongs_to :event_stream
  
  after_save :notify_new_message
    
  def notify_new_message
    message_json = self.ember_json.target!
    db_connection.execute "NOTIFY #{channel}, #{db_connection.quote message_json}"
  end
  
  # @params_ids type = array
  # ChatMessage.find_by_ids(params[:ids])
  def self.find_by_ids(params_ids)
    ids = "(" + params_ids.join(",") + ")"
    where("id in #{ids}")
  end
  
  private
  
  def db_connection
    self.class.connection
  end
  
  def channel
    "eventsteam_#{event_stream_id}"
  end
end
