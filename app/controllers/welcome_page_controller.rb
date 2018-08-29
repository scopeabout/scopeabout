class WelcomePageController < ApplicationController

  def app
    render 'app'
  end

  def welcome
    if logged_in?
      render 'app'
    else
      render 'landing_page', layout: false
    end
  end

  def cookies_consent
  end

  def push_notifications
  end
end
