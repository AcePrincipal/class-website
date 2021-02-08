Rails.application.routes.draw do
  
  get '/programs/open_seats', to: 'programs#open_seats', as:"open_seats"
  resources :programs
  get '/users/:id/add_seat', to: 'programs#add_seat', as: "seats"
  
  resources :users
  get "/in_programs", to: "users#joined"

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
