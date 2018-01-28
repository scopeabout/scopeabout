Rails.application.routes.draw do
  get 'settings/index', to: 'settings#index'
  get 'settings/update_password', to: 'settings#edit_password'
  patch 'settings/update_password', to: 'settings#update_password'

  get 'profile/edit_basic',   to: 'profile#edit_basic'
  patch 'profile/edit_basic', to: 'profile#update_basic'

  get 'welcome_page/welcome'
  get 'sessions/new'
  get 'sessions/logout_success'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  get 'register', to: 'users#new'
  resources 'users'
  root 'welcome_page#welcome'
end
