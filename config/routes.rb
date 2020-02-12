Rails.application.routes.draw do
  resources :tickets
  resources :car_users
  resources :spaces
  resources :parking_zones
  resources :cars
  resources :users
  root to: 'pages#home'
  get '/tickets/new/:parking_zone_id/:street_name', to: 'tickets#new', as: 'street_ticket'
  get "/sessions/new", to: "sessions#new", as: "new_session"
  post "/sessions", to: "sessions#create", as: "sessions"
  delete "/sessions", to: "sessions#destroy"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
