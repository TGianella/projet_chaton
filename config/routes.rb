Rails.application.routes.draw do
  root 'items#index'
  devise_for :users
  resources :items
  resources :orders
  resources :carts
  get '/contact' => 'static_pages#contact'
  get '/about' => 'static_pages#about'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
