Rails.application.routes.draw do

  root to: "mus_albums#index"
  devise_for :users

  resources :mus_albums
  resources :songs
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"

  # config/routes.rb

  # config/routes.rb
resources :songs do
  collection do
    get :search
  end
end

  resources :albums do
    collection do
      get :search
    end
  end

  resources :songs do
    member do
      patch :publish
    end
  end

  resources :albums do
    member do
      patch :publish
    end
  end
end
