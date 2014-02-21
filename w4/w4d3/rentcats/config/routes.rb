Rentcats::Application.routes.draw do
  root to: 'cats#index'

  resources :cats do
    resources :cat_rental_requests, only: [:create, :update]
  end

  post '/cats/:cat_id/cat_rental_requests/:id/approve', to: 'cat_rental_requests#approve', as: 'approve'
  post '/cats/:cat_id/cat_rental_requests/:id/deny', to: 'cat_rental_requests#deny', as: 'deny'

  resources :users, only: [:new, :create]
  resource :session, only: [:new, :create, :destroy]

end
