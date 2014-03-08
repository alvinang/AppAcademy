SecretShareAjax::Application.routes.draw do
  get "tags/new"
  get "tags/create"
  get "tags/destroy"
  resources :users, :only => [:index, :create, :new, :show] do
    resources :secrets, except: :create
    resources :friendships, only: :create
  end

  resources :secrets, only: :create
  resource :session, :only => [:create, :destroy, :new]

  root :to => "users#show"
end
