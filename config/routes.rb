Futamericano::Application.routes.draw do

  ActiveAdmin.routes(self)
  devise_for :admin_users, ActiveAdmin::Devise.config


  localized([:es, :en]) do
    resource :soon, only: :show, controller: :soon
    #resources :teams
    #resource :home, :only => :show, :controller => :home
    #resource :scores, :only => :show
    #resource :standings, :only => :show
    #resource :contacts, :only => [:show, :create]
    #resource :channels, :only => :show
  end


  #namespace :live do
  #  resource :scores, :only => :show
  #end


  #namespace :api do
  #  resource :live_scores, :only => :show, :path => 'live'
  #  resource :game_channels, :only => :show
  #end


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
