App.TransmogrificationsNewController = Ember.ObjectController.extend
  availableTypes:[
    'CoffeeScript',
    'HAML',
    'Markdown',
    'Handlebars'
  ]
  hasType: Ember.computed.notEmpty 'content.sourceType'
  hasNoType: Ember.computed.not 'hasType'