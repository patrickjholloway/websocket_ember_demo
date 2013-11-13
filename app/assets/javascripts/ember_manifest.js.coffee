#= require handlebars
#= require ember
#= require ember-data
#= require showdown
#= require emblem
#= require_self
#= require websocket_demo

@App = Ember.Application.create({
  LOG_TRANSITIONS: true,
  LOG_BINDINGS: true,
});

@App.rootElement = '.ember'
