Rails.application.routes.draw do
  root to: 'home#index'

  #account 
  match '/sign_up', to: 'account#new', via: [:get, ]
  match '/sign_in', to: 'session#new', via: [:get,]
  match '/sign_out', to: 'session#destory', via: [:get, :post]
  match '/auth/:provider/callback', to: 'session#create', via: [:post, :get]

end
