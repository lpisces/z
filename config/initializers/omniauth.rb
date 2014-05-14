Rails.application.config.middleware.use OmniAuth::Builder do
  provider :developer unless Rails.env.production?
  provider :github, 'd7b542204e76c4c1fa6e', '7247265630d358498e7d6b5bdac3b44b773e7bfa'
  provider :identity, :fields => [:email], :model => Identity, :on_failed_registration => AccountController.action(:new)
end
#OmniAuth.config.on_failure = SessionController.action(:failure)

OmniAuth.config.on_failure = Proc.new do |env|
#  if env['omniauth.error']
#    error_type   = CGI::escape(env['omniauth.error'].error)
#    error_reason = CGI::escape(env['omniauth.error'].error_reason)
#    endpoint =
#    "/auth/failure?error_type=#{error_type}&error_reason=#{error_reason}"
#  else
#    endpoint = '/auth/failure'
#  end
  endpoint = '/sign_in_failure'
  [302, {'Location' => endpoint, 'Content-Type'=> 'text/html'}, []]
end


OmniAuth.config.logger = Rails.logger
