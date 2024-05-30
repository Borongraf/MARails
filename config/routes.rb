Rails.application.routes.draw do

  root to: "songs#index"
  devise_for :users
   
  resources :songs

  get "up" => "rails/health#show", as: :rails_health_check

resources :songs do
  collection do
    get :search
  end
end

  resources :songs do
    member do
      patch :publish
    end
  end
end