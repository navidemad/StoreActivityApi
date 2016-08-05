Rails.application.routes.draw do
  resources :visits
  resources :stores
  post 'login', to: 'authentications#login'
  post 'register', to: 'authentications#register'
end
