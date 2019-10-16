Rails.application.routes.draw do
  get 'friend_requests/index'
  get 'friend_requests/create'
  get 'friend_requests/update'
  get 'friend_requests/destroy'
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
end
