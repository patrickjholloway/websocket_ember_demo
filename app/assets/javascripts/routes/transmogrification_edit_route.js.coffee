App.TransmogrificationEditRoute = Ember.Route.extend
  setupController: (controller) ->
    m = @modelFor('transmogrification')
    controller.set 'model', m