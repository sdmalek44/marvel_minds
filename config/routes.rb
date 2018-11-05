Rails.application.routes.draw do
  root 'main#index'

  resources :characters, only: [:index, :show]
  resources :series, only: [:index, :show]
  resources :favorites, only: [:index]
  resources :users, only: [:new, :create]

  get "/login", to: "sessions#new"
  get "/logout", to: "sessions#destroy"
  post "/login", to: "sessions#create"
end
