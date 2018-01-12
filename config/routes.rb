Rails.application.routes.draw do
  root 'welcome_page#welcome'
  get 'welcome_page/welcome'
  get 'sessions/new'

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  resources 'users'
  get 'register', to: 'users#new'
  resources 'users'
end
