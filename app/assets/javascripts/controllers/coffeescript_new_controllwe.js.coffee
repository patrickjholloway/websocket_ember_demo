App.CoffeescriptsNewController = Ember.Controller.extend
  rawContent: ""
  processedContent: ""
  isValidJs: true
  
  processedContent: Ember.computed ->
    try
      compiled = CoffeeScript.compile @get('rawContent')
    catch error
      error
  .property('rawContent', 'processedContent')
  
  actions:
    runJs: ->
      if this.get('isValidJs')
        eval this.get('processedContent')