App.EventStreamController = Ember.ObjectController.extend
  newMessageBody: ""
  eventStreamBinding: 'content'

  init: ->
    url = "ws://" + window.location.host + "/chat"
    @set 'chatSocket', new WebSocket url
    eventStreamId = @get 'eventStream.id'
    @chatSocket.onopen = ->
      @send JSON.stringify
        event_stream: 
          id: eventStreamId

    @chatSocket.onmessage = (event) =>
      @messages.push chatMessage

  actions:

    createNewMessage: ->
      eventStreamId = @get 'eventStream.id'
      message =
        chat_message:
          event_stream_id: eventStreamId
          body: @get 'newMessageBody'
      @chatSocket.send JSON.stringify message
      @.set 'newMessageBody', ""

    scrollToBottom: ->
      $('.messages').scrollTop($('.messages')[0].scrollHeight)
