Rails.application.routes.draw do
  get 'sessions/new'

  root 'welcome_page#welcome'
  get 'welcome_page/welcome'

  get 'register', to: 'users#new'
  resources 'users'
end
