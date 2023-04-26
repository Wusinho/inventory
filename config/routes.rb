Rails.application.routes.draw do
  resources :inventory_purchases
  resources :providers
  resources :products
  resources :categories
  resources :prices
  devise_for :admins
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "categories#index"
end

