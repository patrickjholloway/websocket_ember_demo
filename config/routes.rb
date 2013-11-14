WebsocketEmberDemo::Application.routes.draw do
  resources :event_streams
  resources :chat_messages
  resources :sessions
  resources :transmogrifications
  resources :users do
    member { get :current; }
  end
  
  match 'eventStreams/:id' => "event_streams#show", via: :get
  match 'chatMessages/:id' => "chat_messages#show", via: :get
  match 'chat' => 'sockets#chat', via: 'get'
  match 'demo' => 'sockets#demo', via: 'get'
  match 'signup' => 'users#create', as: 'signup', :via => :post
  match 'login' => 'sessions#new', as: 'login', :via => :get
  match 'logout' => 'sessions#destroy', as: 'logout', :via => :delete
  match 'welcome_path' => 'websocket_demo#index', as: 'welcome', :via => :get

  root :to => 'sessions#new'

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
