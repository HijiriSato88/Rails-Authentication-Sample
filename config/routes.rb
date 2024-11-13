Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check

  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  resources :users, only: [:index,:create,:update]
end
