# For more information see: http://emberjs.com/guides/routing/

App.Router.map (match) ->
	@resource 'dashboard', {path: '/'}, ->
	  @resource 'event_stream', {path: 'event_stream' }, ->
	    @route 'chat',
      @route 'shell',
      @route 'ssh',
      @route 'hangman'