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
  resources :tracks, only: [:show] do
    resources :notes, only: [:create, :new, :destroy]
  end
    
  resources :tracks, only: [:edit, :destroy, :update]
  post '/user/:id/activate', to: 'users#active', as: 'activate'

end
