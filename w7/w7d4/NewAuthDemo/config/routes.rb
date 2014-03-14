NewAuthDemo::Application.routes.draw do
  root :to => "static_pages#home"

  match "/contact", to: "static_pages#contact", via: [:get]
  match "/about", to: "static_pages#about", via: [:get]
  match "/blog", to: "static_pages#blog", via: [:get]

  resources :users, :only => [:create, :new, :show]
  resource :session, :only => [:create, :destroy, :new]
end
