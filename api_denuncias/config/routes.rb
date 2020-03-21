Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, param: :_username
  resources :denunciations,  param: :_id
  post '/auth/login', to: 'authentication#login'
  get '/*a', to: 'application#not_found'
  post 'passwords/forgot', to: 'passwords#forgot'
  post 'passwords/reset', to: 'passwords#reset'
end
