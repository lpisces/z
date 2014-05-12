Rails.application.config.middleware.use OmniAuth::Builder do
  provider :developer unless Rails.env.production?
  provider :github, 'd7b542204e76c4c1fa6e', '7247265630d358498e7d6b5bdac3b44b773e7bfa'
  provider :identity, :fields => [:email], :model => Identity, :on_failed_registration => AccountController.action(:new)
end
OmniAuth.config.on_failure = SessionController.action(:new)
#OmniAuth.config.on_failure = Proc.new { |env|
#  flash[:notice] = I18n.t('sign_in_failed')
#  redirect_to sign_in_path
#}
OmniAuth.config.logger = Rails.logger
