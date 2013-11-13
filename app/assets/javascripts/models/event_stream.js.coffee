App.EventStream = DS.Model.extend
  chatMessages: DS.hasMany('chatMessage')
