Rails.application.routes.draw do
  get 'items/index'
  root 'items#index'
  devise_for :users
  resources :items
  resources :orders
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
