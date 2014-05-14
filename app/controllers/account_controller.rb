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

end
