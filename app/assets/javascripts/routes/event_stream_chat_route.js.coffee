App.EventStreamChatRoute = Ember.Route.extend

  model: ->
    @get('store').find 'eventStream', 1

  setupController: (controller, model) ->
    controller.set 'model', model