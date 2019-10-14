Rails.application.routes.draw do
  root to: 'posts#index'
  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout'}
  resources :users, only: [:index, :show]
  resources :posts
  resources :comments
  resources :posts do
    resources :likes
  end
  resources :comments do
    resources :likes
  end

  resources :users do
    resources :friendships
  end
end
