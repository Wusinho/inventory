Rails.application.routes.draw do
  devise_for :admins,
             path: '',
             path_names: {
               sign_in: 'login',
               sign_out: 'logout',
             },
             controllers: {
               sessions: 'admin/sessions',
               registrations: 'admin/registrations'
             }
  resources :selling_orders, only: [:update]
  resources :customers
  resources :balances
  resources :spends
  resources :inventory_purchases
  resources :providers
  resources :products
  resources :homepages, only: [:index]
  resources :categories
  namespace :super_admin do
    resources :balances
    resources :admins
  end

  # Defines the root path route ("/")
  root "products#index"
end
