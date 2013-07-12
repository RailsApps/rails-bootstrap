RailsBootstrap::Application.routes.draw do
  resources :visitors, only: [:new, :create]
  root :to => 'visitors#new'
end
