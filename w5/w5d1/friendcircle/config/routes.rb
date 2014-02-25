Friendcircle::Application.routes.draw do
  resources :users
  resource  :session
  resources :friend_circles
  resources :posts do
    resources :links
  end

  get "/session/password_reset", to: "sessions#password_reset"
  post "/session/password_reset", to: "sessions#password_reset_email"

  get "/users/:id/edit/:session_token", to: "sessions#sign_in_email"

end
