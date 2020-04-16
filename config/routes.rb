Rails.application.routes.draw do
  root to: 'home#index'
  resources :manufacturers
  resources :car_categories, only: %i[index new create show]
  resources :car_models, only: %i[index new create show]
  resources :rentals, only: [:index]
end