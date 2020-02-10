Rails.application.routes.draw do
  resources :tickets
  resources :car_users
  resources :spaces
  resources :parking_zones
  resources :cars
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
