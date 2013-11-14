App.EventStreamChatController = Ember.ObjectController.extend

  newMessageBody: ""
  eventStreamBinding: 'content'
  messagesBinding: 'content.chatMessages'


  scrollToBottom: ->
    $('.messages').scrollTop $('.messages')[0].scrollHeight

  init: ->
    url = 'ws://' + window.location.host + '/chat'
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
          Ember.run.next =>
            @scrollToBottom()

  actions:

    createNewMessage: ->
      message =
        chat_message:
          event_stream_id: 1
          body: @get 'newMessageBody'
          meta: {ssh: "ls"}
      @chatSocket.send JSON.stringify message
      @.set 'newMessageBody', ""

