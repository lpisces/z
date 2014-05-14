class ForgotPasswordMailer < ActionMailer::Base
  default from: "from@example.com"

  def ready(user)
    @user = user
    @reset_password_url = "#{CONFIG['host']}/#{reset_password_path}?token=#{user.}"
    mail :to => user.email, :subject => I18n.t('password_reset')
  end

end
