Rails.application.routes.draw do
  devise_for :users

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Resources
  resources :items
  resources :categories

  # Cart (singular resource - user has one cart)
  resource :cart, only: [:show]

  # Cart items (nested under cart)
  resources :cart_items, only: [:create, :update, :destroy]

  # Orders
  resources :orders, only: [:index, :show, :create, :new] do
    member do
      post :cancel
    end
  end

  # Defines the root path route ("/")
  root "items#index"
end
