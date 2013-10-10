App.TransmogrificationEditController = Ember.ObjectController.extend
  needs: ['transmogrification']
  isNotValid: true
  
  output: ""
  
  isTypeCoffee: Em.computed ->
    @get('content.sourceType') == 'CoffeeScript'
  .property('content.sourceType')
  
  processedContent: Ember.computed ->
    
    # template = Emblem.compile Handlebars, @get('rawContent')
    # template(this)
    # 
    #   
    #   # template = Handlebars.compile @get('rawContent')
    #   # data = {stuff: true}
    #   # template(data)
    #   
      # template = Emblem.compile Handlebars, @get('rawContent')
      # data = {stuff: true}
      # template(data)
    try
      compiled = CoffeeScript.compile @get('content.source')
      @set 'isNotValid', false
      compiled
    catch error
      @set 'isNotValid', true
      error
  .property('content.source')
  
  actions:
    runJs: ->
      if this.get('isValidJs')
        ret= try
          eval this.get('processedContent')
        catch error
          error
        console.log ret
        @set 'output', ret