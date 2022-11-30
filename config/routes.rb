Rails.application.routes.draw do
  # Defines the root path route ("/")
  root 'projects#index'
  resources :projects
  devise_for :users, 
    controllers: { sessions: 'users/sessions', registrations: 'users/registrations' },
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
