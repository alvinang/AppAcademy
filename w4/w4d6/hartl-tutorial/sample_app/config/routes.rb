SampleApp::Application.routes.draw do  
  root 'static_pages#home'
  resources :users
  
  match '/signup', to: 'users#new', via: 'get'
  match '/help', to: 'static_pages#help', via: 'get'
  match '/about', to: 'static_pages#about', via: 'get'
  match '/contact', to: 'static_pages#contact', via: 'get'

end
