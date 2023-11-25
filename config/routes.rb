Rails.application.routes.draw do
  devise_for :users
  root to: "courses#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :courses, only: [:index]
  # Defines the root path route ("/")
  # root "articles#index"
end
