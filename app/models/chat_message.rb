class ChatMessage < ActiveRecord::Base
  belongs_to :user
  belongs_to :event_stream

  after_save :notify_new_message
  delegate :username, to: :user

  def ember_json
    Jbuilder.encode do |json|
      json.chatMessages do
        json.array! [self], :id, :body, :meta, :username
      end
    end
  end

  def notify_new_message
    message_json = self.ember_json
    db_connection.execute "NOTIFY #{channel}, #{db_connection.quote message_json}"
  end
  
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
