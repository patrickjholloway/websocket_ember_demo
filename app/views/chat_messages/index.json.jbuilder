json.chat_messages do
  json.array! @chat_messages do |chat_message|
    json.partial! 'chat_message', chat_message: chat_message
  end
end
