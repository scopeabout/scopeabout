module Org
  class UserSessionsController < OrganizationController
    skip_before_action :authenticate
    skip_before_action :can_authorize

    def new
      redirect_to root_url if logged_in?
    end

    def create
      user = OrganizationUser.find_by(email: params[:session][:email].downcase)
      if user && user.authenticate(params[:session][:password])
        log_in user
        remember user
        redirect_to root_url
      else
        @error = 'Invalid email/password combination'
        render 'new'
      end
    end

    def destroy
      log_out
      redirect_to logout_success_path
    end

    def session_params
      params.require('session').permit(:email, :password)
    end
  end
end

