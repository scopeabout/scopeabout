Rails.application.routes.draw do
  get 'settings/index'

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
