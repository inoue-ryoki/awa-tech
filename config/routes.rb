Rails.application.routes.draw do
  devise_for :users
  get 'posts/index'
root to: "posts#index"
resources :posts, only: [:index, :new, :create]
resources :users, only: [:edit, :update, :show]
end
