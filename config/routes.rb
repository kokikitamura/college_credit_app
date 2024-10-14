Rails.application.routes.draw do
  resources :users do
    member do
      get "withdraw"
    end
  end
  get    "/login",   to: "sessions#new"
  post   "/login",   to: "sessions#create"
  delete "/logout",  to: "sessions#destroy"
  resources :categories
  resources :courses
end
