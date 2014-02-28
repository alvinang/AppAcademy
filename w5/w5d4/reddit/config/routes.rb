Reddit::Application.routes.draw do
  resources :users, only: [:new, :create]
  resource :session, only: [:new, :create, :destroy]
  resources :subs do
    resources :links, except: [:index, :show]
  end

  resources :links, only: [:show] do
    resources :comments
  end

end
