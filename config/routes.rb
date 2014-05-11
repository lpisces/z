Rails.application.routes.draw do
  get 'account/new'

  match 'account/create', to: 'account#create', via: [:post, :get]
  get 'session/new'
  get 'session/create'
  get 'session/destory'
  get '/auth/:provider/callback', to: 'sessions#create'
end
