class AccountController < ApplicationController
  def new
    @identity = Identity.new 
  end

  def create
  end

  def forgot_password
  end

  def forgot_password_mail
  end

  def f
    redirect_to sign_up_path, :notice => I18n.t('sign_up_failed')
  end

end
