Rails.application.routes.draw do
  get 'password/reset'

  root to: 'home#index'

  #account 
  match '/sign_up', to: 'account#new', via: [:get, ]
  match '/sign_in', to: 'session#new', via: [:get,]
  match '/sign_in_failure', to: 'session#f', via: [:get,]
  match '/sign_out', to: 'session#destory', via: [:get, :post]
  match 'forgot_password', to: 'account#forgot_password', via: [:get, ]
  match 'reset_password', to: 'password#reset', via: [:post, ]
  match '/auth/:provider/callback', to: 'session#create', via: [:post, :get]

end
