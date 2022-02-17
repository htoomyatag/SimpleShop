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
        resources :line_items
    

        post 'add_to_cart' => "line_items#add_to_cart"
        post 'add_to_order' => "orders#add_to_order"

        #For COUNTRY LIST/CREATE/DELETE
        get 'countries' => "countries#index"
        post 'add_countries' => "countries#create"
        delete "remove_countries" => "countries#remove"
     
        #For CURRENCY LIST/CREATE/DELETE
        get 'currencies' => "currencies#index"
        post 'add_currencies' => "currencies#create"
        delete "remove_currencies" => "currencies#remove"

        #For TAX LIST/CREATE/DELETE
        get 'taxes' => "taxes#index"
        post 'add_taxes' => "taxes#create"
        delete "remove_taxes" => "taxes#remove"

        #For REGION LIST/CREATE/DELETE
        get 'regions' => "regions#index"
        post 'add_regions' => "regions#create"
        delete "remove_regions" => "regions#remove"

        #For STORE LIST/CREATE/DELETE
        get 'stores' => "stores#index"
        post 'add_stores' => "stores#create"
        delete "remove_stores" => "stores#remove"

        #For PRODUCT LIST/CREATE/DELETE
        get 'products' => "products#index"
        post 'add_products' => "products#create"
        delete "remove_products" => "products#remove"
     
     
     
     


    end
  end
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_for :users, controllers: {sessions: 'users/sessions',registrations: 'users/registrations'}
  post 'change_password' => "users#change_password"
  post 'change_email' => "users#change_email"



end
