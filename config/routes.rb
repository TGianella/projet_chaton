Rails.application.routes.draw do
  root 'items#index'
  devise_for :users
  resources :items
  resources :orders
  get '/contact' => 'static_pages#contact'
  get '/about' => 'static_pages#about'
  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
