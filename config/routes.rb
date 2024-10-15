Rails.application.routes.draw do
  resources :authors
  resources :books
  resources :genres

  devise_for :users

  post "sign_in", to: "sign_in#sign"
  mount CustomTable::Engine, at: "/custom_table"

  # Defines the root path route ("/")
  root "books#index"
end
