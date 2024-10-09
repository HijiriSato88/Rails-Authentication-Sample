Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check

  get    '/login/current',   to: 'sessions#show'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  resources :users, only: [:index] 
end
