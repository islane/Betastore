Betastore::Application.routes.draw do
  resources :subscriptions
  get '/products' => 'products#index'

  get '/cart' => 'cart#show', as: 'cart'

  resources :products do
    member do
      post 'vote_up'
      post 'vote_down'
      post 'add_to_cart'
      delete 'remove_from_cart'
    end
  end

  namespace :admin do
    resources :products do
      member do
        post 'vote_up'
        post 'vote_down'
      end
    end
    # get '/products/new' => 'products#new', as: 'new_product'
    # get '/products/:id' => 'products#show', as: 'product'
    # get '/products' => 'products#index'
    # post '/products' => 'products#create'
    get  '/login' => 'logins#new', as: 'logins'
    post '/login' => 'logins#create'
  end

  root :to => 'subscriptions#new'
end
