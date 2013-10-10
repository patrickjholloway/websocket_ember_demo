Handlebars.registerHelper 'shout', (input, options) ->
  escaped = Handlebars.Utils.escapeExpression input
  output = $('<h1>').text(escaped.toUpperCase()+"!!!!")[0].outerHTML
  new Handlebars.SafeString(output)

Ember.Handlebars.helper 'boundShout', (input, options) ->
  escaped = Handlebars.Utils.escapeExpression input
  output = $('<h2>').text(escaped.capitalize()+"!")[0].outerHTML  
  new Handlebars.SafeString(output)
