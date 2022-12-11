Rails.application.routes.draw do
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
end