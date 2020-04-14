Rails.application.routes.draw do
  root to: 'home#index'
  resources :manufacturers
  resources :car_categories, only: [:new, :create, :show]
end