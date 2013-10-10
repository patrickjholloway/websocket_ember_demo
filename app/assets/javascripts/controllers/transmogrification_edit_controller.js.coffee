App.TransmogrificationEditController = Ember.ObjectController.extend
  needs: ['transmogrification']
  isNotValid: true
  
  output: ""
  
  isTypeCoffee: Em.computed ->
    @get('content.sourceType') == 'CoffeeScript'
  .property('content.sourceType')
  
  processedContent: Ember.computed ->
    source = @get('content.source')
    try
      context = {foo:"bar"}
      template = Emblem.compile Em.Handlebars, source
      data = {buffer:[]}
      output = template(context,{data:data})
      data.buffer.join('')
    catch e
      debugger
      console.log e
      e
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
    # try
    #   compiled = CoffeeScript.compile @get('content.source')
    #   @set 'isNotValid', false
    #   compiled
    # catch error
    #   @set 'isNotValid', true
    #   error
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