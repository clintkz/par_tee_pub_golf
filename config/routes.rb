Rails.application.routes.draw do
  devise_for :users

  resources :courses,  only: [:show]
  get "/ratings", to: "pages#ratings"

  root to: "courses#index"
<<<<<<< HEAD
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # resources :courses, only: [:index]
  # Defines the root path route ("/")
  # root "articles#index"
  resources :pubs, only: [:index]
  resources :pub_scores, only: [:index, :round_entry]
=======

  resources :pubs, only: [:show, :index]
>>>>>>> master

  resources :courses do
    resources :games, only: [:new, :create]
  end

  resources :participants, only: [:show]

  resources :chatrooms, only: [:show]

  resources :games, only: [:show, :index] do
    member do
      post :start
    end
    get 'scorecard', on: :member
    resources :participants do
      patch :accept, on: :member
      patch :decline, on: :member
      patch :mark_as_arrived, on: :member
    end
  end
end
