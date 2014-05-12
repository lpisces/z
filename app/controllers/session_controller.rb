class SessionController < ApplicationController
  before_action :no_login_required, only: [:new, :create]

  def create
    @user = User.find_or_create_from_auth_hash(auth_hash)
    login_as @user
    redirect_to '/'
  end

  def destory
    logout
    redirect_to sign_in_path
  end

  def new
  end

  protected

  def auth_hash
    request.env['omniauth.auth']
  end

  def failure
    redirect_to login_path, alert: "Authentication failed, please try again."
  end

end
