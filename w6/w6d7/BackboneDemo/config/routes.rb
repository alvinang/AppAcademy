BackboneDemo::Application.routes.draw do
  root to: 'site#root'
  
  namespace :api do
    resources :todos, only: [:create, :destroy, :index, :show, :update] do
      resources :comments, only: :index
    end
    
    resources :comments, only: [:create, :show]
  end
end
