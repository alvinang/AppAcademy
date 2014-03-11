PhotoTagger::Application.routes.draw do
  root :to => "static_pages#root"

  resources :users, :only => [:create, :new, :show]
  resource :session, :only => [:create, :destroy, :new]

  namespace "api", :defaults => { :format => :json } do
    resources :users, :only => [] do
      resources :photos, :only => [:index]
    end

    resources :photos, :only => [:create, :update] do
      resources :photo_taggings, :only => [:index]
    end

    resources :photo_taggings, :only => [:create]
  end

end
