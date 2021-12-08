Rails.application.routes.draw do
  namespace :questions do
    get 'solved/index'
  end

  namespace :admin do
    get "/users/question", to:"users#question"
    resources :users
  end

  root to: "questions#index"
  resources :questions do
    resources :answers, only: [:create]
  end
  get "/question/solved", to: "questions#solved"
  get "/question/unsolved", to: "questions#unsolved"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
