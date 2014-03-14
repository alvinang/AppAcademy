Trellino::Application.routes.draw do
  root to: 'boards#index'  
  
  resources :boards, only: [:index, :show, :create, :update, :destroy] do
    resources :lists, only: [:index, :show, :create, :update, :destroy]
  end
  resources :cards, only: [:create, :update, :destroy] do
    resources :todo_items, only: [:create, :update, :destroy]
  end
  
  resources :card_assignments, only: :destroy
  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create, :destroy]

end
