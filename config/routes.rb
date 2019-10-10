Rails.application.routes.draw do
  root to: 'posts#index'
  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout'}
  resources :users, only: [:index, :show]
  resources :posts
  resources :comments
end
