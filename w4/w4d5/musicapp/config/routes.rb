Musicapp::Application.routes.draw do
  root to: "users#new"
  
  resources :users, only: [:new, :create, :show]
  resource :session, only: [:new, :create, :destroy]
end
