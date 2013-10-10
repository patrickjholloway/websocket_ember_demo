App.TransmogrificationRoute = Ember.Route.extend
  model: (params) ->
    App.Transmogrification.find(params.transmogrifier_id)