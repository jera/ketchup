ActionController::Routing::Routes.draw do |map|
  map.resources :projects, 
    :collection => { :auto_complete_for_user_username => :get, :user_info => :get }
  map.devise_for :users
  map.resources :welcome, :only => :index

  map.root :controller => :welcome

  #map.connect ':controller/:action/:id'
  #map.connect ':controller/:action/:id.:format'
end
