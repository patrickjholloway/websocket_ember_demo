App.EventStreamController = Ember.ObjectController.extend
  newMessageBody: ""
  newDiceRoll: ""
  chatSocket: null
  eventStreamBinding: 'content'

  actions:
    createNewMessage: ->
      message =
        chat_message:
          event_stream_id: @content.id
          body: @newMessageBody
      @chatSocket.send JSON.stringify message
      @.set 'newMessageBody', ""
    createNewRoll: ->
      dice_roll = JSON.stringify
        diceRoll: @newMessageBody
      message =
        chat_message:
          event_stream_id: @content.id
          meta: dice_roll
      @chatSocket.send JSON.stringify message
      @.set 'newDiceRoll', ""
    scrollToBottom: ->
      $('.messages').scrollTop($('.messages')[0].scrollHeight)
