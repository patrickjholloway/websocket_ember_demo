App.CoffeescriptRoute = Ember.Route.extend
  model: (params) ->
    App.Coffeescript.find()