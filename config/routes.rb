Rails.application.routes.draw do
  root 'main#index'

  resources :characters, only: [:index]
  resources :series, only: [:index]
  resources :favorites, only: [:index]

  get "/login", to: "sessions#new"

end
