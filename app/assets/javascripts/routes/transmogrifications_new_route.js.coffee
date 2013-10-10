App.TransmogrificationsNewRoute = Ember.Route.extend
  setupController: (controller) ->
    controller.set 'model', App.Transmogrification.createRecord()
  actions:
    saveTransmogrifier: ->
      @get('controller.content').save().then (obj) =>
        @transitionTo('transmogrification.edit', obj)