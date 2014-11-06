Betastore::Application.routes.draw do
  resources :subscriptions
  get '/products' => 'products#index'

  namespace :admin do
    resources :products
    # get '/products/new' => 'products#new', as: 'new_product'
    # get '/products/:id' => 'products#show', as: 'product'
    # get '/products' => 'products#index'
    # post '/products' => 'products#create'
    get  '/login' => 'logins#new', as: 'logins'
    post '/login' => 'logins#create'
  end

  root :to => 'subscriptions#new'
end
