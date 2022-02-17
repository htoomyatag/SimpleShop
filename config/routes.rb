Rails.application.routes.draw do
  
  namespace :api do
    namespace :v1 do

        get 'carts/:id' => "carts#show", as: "cart"
        delete 'carts/:id' => "carts#destroy"

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

        #For PRODUCT SHOW/LIST/CREATE/DELETE
        get 'product', to: 'products#show', as: 'product'
        get 'products' => "products#index"
        post 'add_products' => "products#create"
        delete "remove_products" => "products#remove"
     
        #Customer ADD PRODUCTS to CART / ADD REDUCE QUANTITY
        post 'add_to_cart' => "line_items#add_to_cart"
        post 'add_quantity' => "line_items#add_quantity"
        post 'reduce_quantity' => "line_items#reduce_quantity"
        #Customer REMOVE ALL PRODUCES FROM CART
        post 'remove_allproduct_in_cart' => "line_items#remove_allproduct_in_cart"
        #Customer REMOVE ONE PRODUCES FROM CART
        post 'remove_product_in_cart' => "line_items#remove_product_in_cart"
        #customer products in CART to ORDER
        post 'add_to_order' => "orders#add_to_order"
     


    end
  end

  post 'checkout/payment'
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_for :users, controllers: {sessions: 'users/sessions',registrations: 'users/registrations'}
  post 'change_password' => "users#change_password"
  post 'change_email' => "users#change_email"



end
