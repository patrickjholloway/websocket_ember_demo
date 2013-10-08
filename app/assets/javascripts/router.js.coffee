# For more information see: http://emberjs.com/guides/routing/

App.Router.map (match) ->
  @resource 'coffeescripts', {path: '/coffeescripts' }, ->
    @route 'index', {path:'/'}
    @route 'new', {path:'/new'}
    @resource 'coffeescript', { path:':coffeescripts_id' }, ->