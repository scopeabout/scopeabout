Rails.application.routes.draw do
  root 'welcome_page#welcome'
  get 'welcome_page/welcome'

  get 'register', to: 'users#new'
  resources 'users'
end
