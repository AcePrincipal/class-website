Rails.application.routes.draw do
  resources :programs
  resources :users, only: [:welcome, :new, :show]
  resources :categories, only: [:index, :show] do 
    resources :programs, only: [:new, :index]
  end 

  get '/auth/google_oauth2/callback', to: "sessions#omniauth"

  get "/", to: "users#welcome"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  post "/logout", to: "sessions#destroy"
  delete '/logout', to: 'sessions#destroy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
