Rails.application.routes.draw do
  root 'posts#index'
  devise_for :users
  resources :posts do
    resource :favorites, only: [:create, :destroy]
  end
  resources :users
end
