class PasswordController < ApplicationController
  def reset
    @user = User.where('email' => params[:email]).first
    return redirect_to(password_reset_failed_path, :notice => I18n.t('reset_password_user_not_exists')) if @user.nil?
    @user.send_password_reset_mail
    flash[:notice] = I18n.t('reset_password_succeed')
  end

  def f
  end

  def reset_params 
    params.permit(:email)
  end
end
