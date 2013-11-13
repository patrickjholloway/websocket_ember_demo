class ChatMessageSerializer < ActiveModel::Serializer
  embed :ids
  
  attributes :id, :body, :meta, :username
  has_one :event_stream
  has_one :user
end
