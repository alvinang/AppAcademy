Reddit::Application.routes.draw do
  root to: "sessions#new"
  
  resources :users, only: [:new, :create]
  resource :session, only: [:new, :create, :destroy]
  resources :subs 

  resources :links, only: [:show] do
    resources :comments, only: [:create, :new, :show]
  end

end
