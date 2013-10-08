App.CoffeescriptsRoute = Ember.Route.extend
  model: (params) ->
    App.Coffeescript.find()
