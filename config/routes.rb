Rails.application.routes.draw do
  root to: 'home#index'
  resources :manufacturers
  resources :car_categories, only: [:index, :new, :create, :show]
end