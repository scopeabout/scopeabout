Rails.application.routes.draw do
  root 'welcome_page#welcome'
  get 'welcome_page/welcome'
  
  resources 'users'
  get 'register', to: 'users#new'
end
