Rails.application.routes.draw do
  

  get 'checkout/purchase'
  get 'checkout/payment_option'
  namespace :api do
    namespace :v1 do
      resources :posts
    end
  end
  resources :users
  resources :taxes
  resources :stores
  resources :regions
  resources :currencies
  resources :countries
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
    get '/admin_panel', to: 'admin_dashboard#admin_panel', as: :admin_panel

  namespace :api do
    namespace :v1 do
        resources :currencies, only: [:index, :create, :destroy, :update]
    end
  end

  devise_for :users, controllers: {sessions: 'users/sessions',registrations: 'users/registrations'}

  get 'carts/:id' => "carts#show", as: "cart"
  delete 'carts/:id' => "carts#destroy"

  post 'line_items/:id/add' => "line_items#add_quantity", as: "line_item_add"
  post 'line_items/:id/reduce' => "line_items#reduce_quantity", as: "line_item_reduce"
  # post 'line_items' => "line_items#create"
  # get 'line_items/:id' => "line_items#show", as: "line_item"
  # delete 'line_items/:id' => "line_items#destroy"
  resources :products
  resources :orders
  resources :line_items
  root 'products#index'






end
