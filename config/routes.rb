Rails.application.routes.draw do
  devise_for :users
  get 'posts/index'
root to: "posts#index"
resources :posts, only: [:index, :new, :create]
resources :users, only: [:edit, :update, :show]
  resources :messages, only: [:create]
  resources :rooms, only: [:create, :show, :index]
end
