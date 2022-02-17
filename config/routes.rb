Rails.application.routes.draw do
  
  post 'checkout/payment'
  get 'checkout/payment_option'
  namespace :api do
    namespace :v1 do

        get 'carts/:id' => "carts#show", as: "cart"
        delete 'carts/:id' => "carts#destroy"

        post 'line_items/:id/add' => "line_items#add_quantity", as: "line_item_add"
        post 'line_items/:id/reduce' => "line_items#reduce_quantity", as: "line_item_reduce"
        post 'line_items' => "line_items#create"
        get 'line_items/:id' => "line_items#show", as: "line_item"
        delete 'line_items/:id' => "line_items#destroy"

 

        resources :products
        resources :orders
        # resources :countries
        resources :line_items
        resources :taxes
        resources :stores
        resources :regions
        resources :currencies
        resources :countries

        post 'add_to_cart' => "line_items#add_to_cart"
        post 'add_to_order' => "orders#add_to_order"

        post 'add_countries' => "countries#create"
        get 'countries' => "countries#index"
        delete "remove_countries" => "countries#remove"



    end
  end
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_for :users, controllers: {sessions: 'users/sessions',registrations: 'users/registrations'}
  post 'change_password' => "users#change_password"
  post 'change_email' => "users#change_email"



end
