Rails.application.routes.draw do
  devise_for :users

  resources :courses,  only: [:show]
  get "/ratings", to: "pages#ratings"

  root to: "courses#home"

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

  resources :games, only: [:show, :index, :end_game] do
    member do
      patch :start
      patch :end_game
    end
    get 'scorecard', on: :member, as: "scorecard"
    resources :participants, except: [:show, :index, :create, :new, :edit, :destroy, :update] do
      patch :accept, on: :member
      patch :decline, on: :member
      patch :mark_as_arrived, on: :member
      # resources :pub_scores
    end
  end
end
