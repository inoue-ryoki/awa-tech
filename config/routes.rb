Rails.application.routes.draw do
  get 'relationships/followings'
  get 'relationships/followers'
  devise_for :users
  get 'posts/index'
root to: "posts#index"
resources :posts, only: [:index, :new, :create, :destroy]
resources :users, only: [:edit, :update, :show] do
  member do
    get :follows, :followers
  end
  resource :relationships, only: [:create, :destroy]
end

resources :messages, only: [:create]
resources :rooms, only: [:create, :show, :index]
end
