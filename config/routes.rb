require 'sidekiq/web'

Betastore::Application.routes.draw do
  resources :subscriptions
  resources :orders

  mount Sidekiq::Web => '/sidekiq'

  root :to => 'subscriptions#new'
  get '/products' => 'products#index'
  get '/cart' => 'cart#show', as: 'cart'
  get '/about' => 'about#index'
  get '/contact' => 'contact#index'
    
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
    root :to => 'products#index'
    get  '/settings/:email' => 'settings#show', as: 'settings'
    get  '/orders' => 'orders#index'
    get  '/login' => 'logins#new', as: 'logins'
    post '/login' => 'logins#create'
    delete	'/logout' => 'logins#destroy'
  end

end
