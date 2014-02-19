RoutesPractice::Application.routes.draw do
  root to: 'users#index'
  resources :users, only: [:index, :create, :destroy, :update, :show]  do
    resources :contacts, only: [:index, :create]
    # get 'contacts/favorites', :on => :member
    resources :groups, only: [:index, :create] do
      resources :contact_groups, only: :create
    end

    resources :comments, only: :create
  end
  get '/users/:id/contacts/favorites', to: 'users#favorites', as: 'favorite_contacts'
  patch '/contact_shares/:id/favorite', to: 'contact_shares#favorite', as: 'favorite_contact_share'

  resources :comments, only: [:destroy, :update]
  resources :groups, only: [:destroy, :update, :show]
  resources :contact_groups, only: :destroy
  resources :contacts, only: [:update, :show, :destroy]
  resources :contact_shares, only: [:create, :destroy]


  # get    '/users',          # to: 'users#index',   as: 'users'
  # post   '/users',          to: 'users#create'
  # get    '/users/new',      to: 'users#new',     as: 'new_user'
  # get    '/users/:id',      to: 'users#show',    as: 'user'
  # patch  '/users/:id',      to: 'users#update'
  # put    '/users/:id',      to: 'users#update'
  # delete '/users/:id',      to: 'users#destroy'
  # get    '/users/:id/edit', to: 'users#edit',    as: 'edit_user'
end
