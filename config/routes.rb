Rails.application.routes.draw do
  root to: 'posts#index'
  devise_for :users
  resources :users, only: [:index, :show]
  resources :posts
end
