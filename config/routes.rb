Futamericano::Application.routes.draw do

  ActiveAdmin.routes(self)
  devise_for :admin_users, ActiveAdmin::Devise.config

  resource :soon

  root to: 'soon#show'

end
