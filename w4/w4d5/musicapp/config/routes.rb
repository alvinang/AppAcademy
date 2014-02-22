Musicapp::Application.routes.draw do
  root to: "users#new"
  
  resources :users, only: [:create, :new, :show]
  resource :session, only: [:create, :destroy, :new]
  
  resources :bands do
    resources :albums, only: [:create, :index, :new]
  end
    
  resources :albums, only: [:edit, :destroy, :show, :update] do
    resources :tracks, only: [:create, :index, :new]
  end
  
  resources :tracks, only: [:edit, :destroy, :show, :update]
end
