Rails.application.routes.draw do
  devise_for :users

  resources :courses,  only: [:show]
  get "/ratings", to: "pages#ratings"

  root to: "courses#index"

  resources :pubs, only: [:show, :index]

  resources :courses do
    resources :games, only: [:new, :create]
  end

  resources :participants, only: [:show] do
    member do
      post :save_score
    end
  end

  resources :participants do
    resources :pub_scores, only: [:create, :update]
  end

  # resources :chatrooms, only: [:show]
  resources :chatrooms, only: :show do
    resources :messages, only: :create
  end

  resources :games, only: [:show, :index] do
    member do
      post :start
      get 'participants_show'
    end
    get 'scorecard', on: :member
    resources :participants do
      patch :accept, on: :member
      patch :decline, on: :member
      patch :mark_as_arrived, on: :member
    end
  end
end
