Rails.application.routes.draw do

  devise_for :users
  resources :books

  post "sign_in", to: "sign_in#sign"
  mount CustomTable::Engine, at: "/custom_table"

  # Defines the root path route ("/")
  root "books#index"
end
