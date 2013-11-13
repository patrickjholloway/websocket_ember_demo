App.EventStreamChatRoute = Ember.Route.extend

  model: ->
    @get('store').find 'event_stream', 1

  setupController: (controller, model) ->
    controller.set 'model', model