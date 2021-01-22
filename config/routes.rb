Rails.application.routes.draw do
  resources :categories
  resources :seats
  resources :programs
  resources :users

  get "/", to: "users#welcome"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  post "/logout", to: "sessions#destroy"
  delete '/logout', to: 'sessions#destroy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
