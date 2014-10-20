Betastore::Application.routes.draw do
  resources :subscriptions
  get '/products' => 'products#index'
  root :to => 'subscriptions#new'
end
