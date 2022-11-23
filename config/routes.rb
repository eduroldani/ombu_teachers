Rails.application.routes.draw do
  devise_for :users
  root to: "projects#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :profiles, only: [:show]

  resources :projects do
    resources :bookings, only: [:new, :create]
  end
end
