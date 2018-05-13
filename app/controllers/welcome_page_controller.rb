class WelcomePageController < ApplicationController

  def app
    render 'app'
  end

  def welcome
    render 'landing_page', layout: false
  end

  def cookies_consent
  end
end
