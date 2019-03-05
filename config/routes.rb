Rails.application.routes.draw do
  scope module: 'org' do
    constraints OrganizationRouteConstrains.new do
      get '/', to: 'feeds#index'
      get '/login', to: 'user_sessions#new'
      post '/login', to: 'user_sessions#create'
      get 'logout', to: 'user_sessions#destroy'
      get '/logout_success', to: 'user_sessions#logout_success'
    end
  end

  get '/push_notifications', to: 'welcome_page#push_notifications'
  get '/cookies', to: 'welcome_page#cookies_consent'
  root 'welcome_page#welcome'
end
