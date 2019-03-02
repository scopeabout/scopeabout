class WelcomePageController < ApplicationController

  layout proc { logged_in? ? 'application' : 'guest' }

  def app
    render 'app'
  end

  def welcome
    if logged_in?
      render 'app'
    else
      render 'landing_page'
    end
  end

  def cookies_consent
  end

  def push_notifications
  end
end
