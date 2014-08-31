class ForgotPasswordMailer < ActionMailer::Base
  default from: CONFIG['email_from'], 'Content-Transfer-Encoding' => '7bit'
  default :charset => "utf-8"
  default :content_type => "text/html"

  def ready(user)
    @user = user
    @reset_password_url = "http://#{CONFIG['host']}#{reset_password_path}?token=#{user.password_reset_token}"
    mail :to => user.email, :subject => I18n.t('password_reset')
  end

end
