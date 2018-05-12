Rails.application.routes.draw do
  get 'settings/index', to: 'settings#index'
  get 'settings/update_password', to: 'settings#edit_password'
  patch 'settings/update_password', to: 'settings#update_password'
  get 'settings/update_profile_photo', to: 'settings#edit_profile_photo'
  patch 'settings/update_profile_photo', to: 'settings#update_profile_photo'

  get 'profile/edit_basic',   to: 'profile#edit_basic'
  patch 'profile/edit_basic', to: 'profile#update_basic'

  get 'profile', to: 'profile#show'

  get 'welcome_page/welcome'
  get '/cookies', to: 'welcome_page#cookies_consent'
  get 'sessions/new'
  get 'sessions/logout_success'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  get 'register', to: 'users#new'
  resources 'users'
  root 'welcome_page#welcome'
end
