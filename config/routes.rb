Rails.application.routes.draw do
  # Defines the root path route ("/")
  root "projects#index"
  resources :projects
  # devise_for :users
end
