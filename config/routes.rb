Drat::Application.routes.draw do

  root :to => 'pages#home'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  #Api
  mount API => '/api'

end
