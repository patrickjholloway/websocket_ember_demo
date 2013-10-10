App.TransmogrificationsRoute = Ember.Route.extend
  model: (params) ->
    App.Transmogrification.find()
