class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  def authenticate
    redirect_to login_url unless logged_in?
  end
end
