json.id event_stream.id
json.name event_stream.name
json.chat_messages event_stream.chat_messages.map(&:id)