Rails.application.routes.draw do
  root :to => 'homes#top'
  devise_for :users
  resources :posts do
    resource :favorites, only: [:create, :destroy]
    resources :comments, only: [:create, :destroy]
  end
  resources :users do
    resource :relationships, only: [:create, :destroy]
    get :follows, on: :member
    get :followers, on: :member
  end
end
