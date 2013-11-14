App.EventStreamChatController = Ember.ObjectController.extend

  newMessageBody: ""
  eventStreamBinding: 'content'
  messagesBinding: 'content.chatMessages'

  init: ->
    url = "ws://" + window.location.host + "/chat"
    @set 'chatSocket', new WebSocket url
    @chatSocket.onopen = ->
      @send JSON.stringify
        event_stream: 
          id: 1

    @chatSocket.onmessage = (event) =>
      payload = JSON.parse(event.data)
      @store.pushPayload('chat_message', payload)
      Ember.run.next =>
        @store.find('chatMessage', payload.chatMessages[0].id).then (msg) =>
          @get('chatMessages').pushObject msg

  actions:

    createNewMessage: ->
      message =
        chat_message:
          event_stream_id: 1
          body: @get 'newMessageBody'
      @chatSocket.send JSON.stringify message
      @.set 'newMessageBody', ""

    scrollToBottom: ->
      $('.messages').scrollTop($('.messages')[0].scrollHeight)
