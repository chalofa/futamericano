Futamericano::Application.routes.draw do

  ActiveAdmin.routes(self)
  devise_for :admin_users, ActiveAdmin::Devise.config

  resource :soon

  root to: 'soon#show'

end



#== Route Map
# Generated on 12 Jul 2012 01:17
#
#                       soon POST       /soon(.:format)                     soons#create
#                   new_soon GET        /soon/new(.:format)                 soons#new
#                  edit_soon GET        /soon/edit(.:format)                soons#edit
#                            GET        /soon(.:format)                     soons#show
#                            PUT        /soon(.:format)                     soons#update
#                            DELETE     /soon(.:format)                     soons#destroy
#                       root            /                                   soon#show
