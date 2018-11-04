Rails.application.routes.draw do
  root 'main#index'

  resources :characters, only: [:index]
  resources :series, only: [:index]
  resources :favorites, only: [:index]
  resources :users, only: [:new, :create]

  get "/login", to: "sessions#new"
  get "/logout", to: "sessions#destroy"
  post "/sessions", to: "sessions#create"
end
