ActionController::Routing::Routes.draw do |map|

  map.namespace :admin do |admin|
    admin.logout '/logout', :controller => 'sessions', :action => 'destroy'
    admin.login '/login', :controller => 'sessions', :action => 'new'
    admin.resources :pages, :as => :paginas, :collection => { :reorder=>:get, :order=>:post }
    admin.resources :image_galleries, :as => :projetos, :collection => { :reorder=>:get, :order=>:post } do |image_gallery|
      image_gallery.resources :images, :as => :imagens, :collection => { :reorder=>:get, :order=>:post }
    end
    admin.resources :posts, :as => :blog
    admin.resources :users, :as => :usuarios
    admin.resource :session
    admin.root :controller => 'pages'
  end

  map.pages '/paginas/:action', :controller => 'pages'
  map.resources :pages, :as => :paginas
  map.resources :posts, :as => :blog
  map.resources :image_galleries, :as => :projetos
  map.root :controller => 'pages', :action => 'index'
end
