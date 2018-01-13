Rails.application.routes.draw do
  get 'settings/index'

  get 'welcome_page/welcome'
  get 'sessions/new'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  get 'register', to: 'users#new'
  resources 'users'
  root 'welcome_page#welcome'
end
