Rails.application.routes.draw do
  devise_for :users

  resources :courses,  only: [:show]
  get "/ratings", to: "pages#ratings"

  root to: "courses#index"

  resources :pubs, only: [:index]

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
