Rails.application.routes.draw do
  devise_for :users
  get 'posts/index'
root to: "posts#index"
resources :posts, only: :index
resources :users, only: [:edit, :update]
end
