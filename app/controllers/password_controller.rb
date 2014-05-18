class PasswordController < ApplicationController
  def reset_mail
    @user = User.where('email' => params[:email]).first
    return redirect_to(password_reset_failed_path, :notice => I18n.t('reset_password_user_not_exists')) if @user.nil?
    @user.send_password_reset_mail
    flash[:notice] = I18n.t('reset_password_send_mail_succeed')
  end

  def reset
    @user = User.where('password_reset_token' => params[:token]).first
    return redirect_to(password_reset_failed_path, :notice => I18n.t('reset_password_invalid_token')) if @user.nil?
  end

  def update
    @user = User.where('password_reset_token' => params[:password_reset_token]).first
    return redirect_to(password_reset_failed_path, :notice => I18n.t('reset_password_invalid_token')) if @user.nil?
    @identity = Identity.where('email' => @user.email).first
    @identity.password = params[:password]
    @identity.password_confirmation = params[:password_confirmation]
    if @identity.save
      return redirect_to(password_reset_failed_path, :notice => I18n.t('reset_password_succeed'))
    else
      return redirect_to(password_reset_failed_path, :notice => I18n.t('reset_password_failed'))
    end
  end

  def f
  end

  private

  def update_params
    params.permit(:password, :password_confirm, :password_reset_token)
  end

  def reset_params
    params.permit(:token)
  end

  def reset_mail_params 
    params.permit(:email)
  end
end
