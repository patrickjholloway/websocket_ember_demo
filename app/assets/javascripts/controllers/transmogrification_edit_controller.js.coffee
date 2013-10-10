App.TransmogrificationEditController = Ember.ObjectController.extend
  needs: ['transmogrification']
  isNotValid: true
  
  output: ""
  
  isTypeCoffee: Em.computed ->
    @get('content.sourceType') == 'CoffeeScript'
  .property('content.sourceType')
  
  availableTypes:[
    'CoffeeScript',
    'Markdown',
    'Emblem',
    'Handlebars',
    'Ember Handlebars'
  ]
  
  selectedType: ""
  
  processedContent: Ember.computed ->
    source = @get('content.source')
    context = {foo:"bar", deep: {bing:"bang",bool:true,n:234,derp:"doop"}}
    type = @selectedType
    switch type
      when 'Emblem'
        try
          template = Emblem.compile Em.Handlebars, source
          data = {buffer:[]}
          data.view = {registerObserver:Em.K,appendChild:Em.K}
          console.log context.foo
          output = template(context,{data:data})
          data.buffer.join('')
        catch e
          # debugger
          console.log e
          e
      when 'Ember Handlebars'
        try
          template = Em.Handlebars.compile source
          data.view = {registerObserver:Em.K,appendChild:Em.K}
          output = template(context,{data:data})
          data.buffer.join('')
        catch e
          # debugger
          console.log e
          e
      when 'Handlebars'
        try
          template = Handlebars.compile source
          template(context)
        catch e
          # debugger
          console.log e
          e
      when "CoffeeScript"
        try
          CoffeeScript.compile source
        catch error
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