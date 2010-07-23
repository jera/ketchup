ActionController::Routing::Routes.draw do |map|
  map.resources :projects
  map.devise_for :users
  map.resources :welcome, :only => :index

  map.root :controller => :welcome

  #map.connect ':controller/:action/:id'
  #map.connect ':controller/:action/:id.:format'
end
