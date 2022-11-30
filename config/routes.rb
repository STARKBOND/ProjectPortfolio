Rails.application.routes.draw do
  # Defines the root path route ("/")
  root 'projects#index'
  resources :projects
  devise_for :users, 
    controllers: { 
      sessions: 'users/sessions', 
      confirmations: 'users/confirmations',
      registrations: 'users/registrations', 
      passwords: 'users/passwords',
      unlocks: 'users/unlocks'
    },
    path: 'auth',
    path_names: { 
      sign_in: 'login', 
      sign_out: 'logout',
      password: 'secret',
      confirmation: 'verification',
      unlock: 'unblock', 
      registration: 'register',
      sign_up: 'cmon_let_me_in' 
    }
    # devise_scope :user do
    #   get 'login', to: 'users/sessions#new'
    #   post 'login', to: 'users/sessions#create'
    #   get 'logout', to: 'users/sessions#destroy'
    #   get 'cmon_let_me_in', to: 'users/registrations#new'
    #   post '', to: 'users/registrations#create'
    #   get 'edit', to: 'users/registrations#edit'
    #   put '', to: 'users/registrations#update'
    #   get 'cancel', to: 'users/registrations#cancel'
    #   delete '', to: 'users/registrations#destroy'
    # end
end