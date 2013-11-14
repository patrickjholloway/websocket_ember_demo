json.event_streams do
  json.array! @event_streams do |event_stream|
    json.partial! 'event_stream', event_stream: event_stream
  end
end
