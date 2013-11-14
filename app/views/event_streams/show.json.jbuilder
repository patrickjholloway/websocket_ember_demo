json.eventStream do
  json.partial! 'event_stream', event_stream: @event_stream
end
json.chatMessages do
  json.array! @event_stream.chat_messages do |chat_message|
    json.partial! 'chat_messages/chat_message', chat_message: chat_message
  end
end