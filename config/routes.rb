Rails.application.routes.draw do
  resources :information
  get 'relationships/followings'
  get 'relationships/followers'
  devise_for :users
  get 'posts/index'
root to: "posts#index"
post '/posts/guest_sign_in', to: 'posts#guest_sign_in'
resources :posts, only: [:index, :new, :create, :destroy] do
   collection do
      get 'search'
    end
end
resources :users, only: [:edit, :update, :show] do
  member do
    get :follows, :followers
  end
  resource :relationships, only: [:create, :destroy]
end

resources :messages, only: [:create]
resources :rooms, only: [:create, :show, :index]
end
