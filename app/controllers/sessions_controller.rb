class SessionsController < ApplicationController
  def new
    redirect_to root_url if logged_in?
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
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
  end

  def session_params
    params.require('session').permit(:email, :password)
  end
end
