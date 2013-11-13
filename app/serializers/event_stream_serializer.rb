class EventStreamSerializer < ActiveModel::Serializer
  embed :ids
  
  attributes :id, :name
  has_many :chat_messages
end
