Betastore::Application.routes.draw do
  resources :subscriptions
  get '/products' => 'products#index'

  namespace :admin do
    get '/products/:id' => 'products#show', as: 'product'
    get '/products' => 'products#index'
  end

  root :to => 'subscriptions#new'
end
