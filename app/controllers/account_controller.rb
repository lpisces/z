class AccountController < ApplicationController
  before_action :no_login_required, only: [:new, :forgot_password_mail, :forgot_password, :f]
  before_action :login_required, only: [:profile, ]

  def new
    @identity = Identity.new 
  end

  def forgot_password
  end

  def forgot_password_mail
  end

  def f
    redirect_to sign_up_path, :notice => I18n.t('sign_up_user_exists') 
  end

  def profile
    @user = current_user
  end

  def update_profile
    @user = current_user
    @user.nick = params[:nick]
    if @user.save
      return redirect_to(profile_path, :notice => I18n.t('update_profile_succeed'))
    else
      return redirect_to(profile_path, :notice => I18n.t('update_profile_failed'))
    end
  end

  private

  def update_profile_params
    params.permit(:nick)
  end

end
