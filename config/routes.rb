Rails.application.routes.draw do
  resources :selling_orders, only: [:update]
  resources :customers
  resources :inventory_purchases
  resources :providers
  resources :products
  resources :categories
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


  # Defines the root path route ("/")
  root "products#index"
end


# <%= form_for(resource, as: resource_name, url: session_path(resource_name),
#              html: { class: 'log_in__form p-4' }) do |f| %>
#     <h2 class="m-0">3B's</h2>
#     <small class="mb-4">Algo para comprar</small>
#   <%= image_tag('muestra.png', class: 'mb-4') %>
#
#   <%= f.email_field :email, autofocus: true, autocomplete: "email", placeholder: :email, class: 'mb-4' %>
#
#     <%= f.password_field :password, autocomplete: "current-password", placeholder: :password, class: 'mb-4' %>
#
#     <%= f.submit "Log in", class: 'mb-2' %>
# <% end %>
