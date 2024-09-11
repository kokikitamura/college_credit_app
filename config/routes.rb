Rails.application.routes.draw do
  resources :users do
    member do
      get "withdraw"
    end
  end
end
