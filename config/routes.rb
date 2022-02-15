Rails.application.routes.draw do
  resources :user_roles
  resources :users
  resources :taxes
  resources :stores
  resources :regions
  resources :products
  resources :currencies
  resources :countries
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
    get '/admin_panel', to: 'admin_dashboard#admin_panel', as: :admin_panel
end
