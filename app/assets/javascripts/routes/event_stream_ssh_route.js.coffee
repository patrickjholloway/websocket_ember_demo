App.EventStreamSshRoute = Ember.Route.extend

  model: ->
    @get('store').find 'eventStream', 2

  setupController: (controller, model) ->
    controller.set 'model', model