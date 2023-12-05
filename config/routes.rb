Rails.application.routes.draw do
  devise_for :users

  resources :courses,  only: [:show]

  root to: "courses#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # resources :courses, only: [:index]
  # Defines the root path route ("/")
  # root "articles#index"
  resources :pubs, only: [:index]
  resources :pub_scores, only: [:index, :round_entry]

  resources :courses do
    resources :games, only: [:new, :create]
  end

resources :games, only: [:show, :index] do
  get 'scorecard', on: :member
  resources :participants do
    patch :accept, on: :member
    patch :decline, on: :member
    patch :mark_as_arrived, on: :member
  end
end

end
