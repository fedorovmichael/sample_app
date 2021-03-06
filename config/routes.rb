Rails.application.routes.draw do
  #get 'users/new'
  resources :users
  resources :sessions, only: [ :new, :create, :destroy ]
  root  'static_pages#home'
  match '/signup',  to: 'users#new',             via: 'get'
  match '/about',   to: 'static_pages#about',    via: 'get'
  match '/help',    to: 'static_pages#help',     via: 'get'
  match '/contact', to: 'static_pages#contact',  via: 'get'
  
  match '/signin',  to: 'sessions#new',           via: 'get'
  match '/signout', to: 'sessions#destroy',       via: 'delete'        
  
#  get 'static_pages/home'
#  get 'static_pages/help'
#  get 'static_pages/about'
#  get 'static_pages/contact'
  
end
