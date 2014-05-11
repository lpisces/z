Rails.application.config.middleware.use OmniAuth::Builder do
  provider :developer unless Rails.env.production?
  provider :github, 'd7b542204e76c4c1fa6e', '7247265630d358498e7d6b5bdac3b44b773e7bfa'
  provider :identity, :fields => [:email], :model => Identity
end
