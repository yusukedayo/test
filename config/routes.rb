Rails.application.routes.draw do
  root to: "questions#index"

  namespace :questions do
    get 'solved/index'
  end

  namespace :admin do
    get "/users/question", to:"users#question"
    resources :users
  end

  resources :questions do
    collection do
      get :solved
      get :unsolved
    end

    member do
      post :solve
    end
    resources :answers, only: [:create]
  end

  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
end
