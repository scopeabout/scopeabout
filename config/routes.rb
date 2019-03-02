Rails.application.routes.draw do
  get '/push_notifications', to: 'welcome_page#push_notifications'
  get '/cookies', to: 'welcome_page#cookies_consent'
  root 'welcome_page#welcome'
end
