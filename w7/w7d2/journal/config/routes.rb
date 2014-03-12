Journal::Application.routes.draw do
  root to: 'api/posts#index'

  namespace :api do
    resources :posts
  end

end
