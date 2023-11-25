Rails.application.routes.draw do
  devise_for :users
 
  resources :courses,  only: [:show]

  root to: "courses#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :courses, only: [:index]
  # Defines the root path route ("/")
  # root "articles#index"

  resources :courses do
    resources :games, only: [:new, :create]
  end

  resources :games, only: [:show]

end
