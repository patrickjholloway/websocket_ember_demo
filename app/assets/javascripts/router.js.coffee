# For more information see: http://emberjs.com/guides/routing/

App.Router.map (match) ->
  @resource 'transmogrifications', {path: '/transmogrifications' }, ->
    @route 'index', {path:'/'}
    @route 'new', {path:'/new'}
    @resource 'transmogrification', { path:':transmogrification_id' }, ->
      @route 'edit', {path:'/edit'}