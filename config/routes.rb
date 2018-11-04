Rails.application.routes.draw do
  root 'main#index'

  resources :characters, only: [:index]
end
