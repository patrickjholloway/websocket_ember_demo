App.Transmogrification = DS.Model.extend
  name: DS.attr('string')
  sourceType: DS.attr('string')
  source: DS.attr('string')
  compiled: DS.attr('string')