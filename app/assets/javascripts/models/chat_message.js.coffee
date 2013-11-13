App.ChatMessage = DS.Model.extend
  body: DS.attr('string')
  meta: DS.attr('string')
  username: DS.attr('string')
  eventStream: DS.belongsTo('eventStream')
