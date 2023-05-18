Rails.application.routes.draw do
  resources :selling_orders, only: [:update]
  resources :customers
  resources :inventory_purchases
  resources :providers
  resources :products
  resources :categories
  devise_for :admins
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "products#index"
end

