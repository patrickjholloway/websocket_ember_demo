#= require jquery
#= require jquery_ujs
#= require coffee-script
#= require handlebars
#= require ember
#= require ember-data
#= require foundation
#= require showdown
#= require_self
#= require template

@App = Ember.Application.create({
  LOG_TRANSITIONS: true,
  LOG_BINDINGS: true,
});

#= require_tree .
@App.rootElement = '.ember'
$(document).foundation()
