class ApplicationController < ActionController::Base
  before_action :set_raven_context
  before_action :set_home_page

  protect_from_forgery with: :exception
  include SessionsHelper

  def authenticate
    redirect_to login_url unless logged_in?
  end

  private

  def set_raven_context
    Raven.user_context(id: session[:current_user_id]) # or anything else in session
    Raven.extra_context(params: params.to_unsafe_h, url: request.url)
  end

  def set_home_page
    @base_home_page = request.base_url.gsub("#{request.subdomain}.", '')
  end
end
