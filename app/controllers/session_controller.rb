class SessionController < ApplicationController
  before_action :no_login_required, only: [:new, :create, :failure, :f]
  before_action :login_required, only: [:destory, ]

  def create
    @user = User.find_or_create_from_auth_hash(auth_hash)
    login_as @user
    redirect_to root_path
  end

  def destory
    logout
    redirect_to sign_in_path
  end

  def new
  end

  def f
    redirect_to sign_in_path, :notice => I18n.t('sign_in_failed')
  end

  protected

  def auth_hash
    request.env['omniauth.auth']
  end

  def failure
    redirect_to login_path, alert: "Authentication failed, please try again."
  end

end
