Rails.application.routes.draw do
  
  root to: 'posts#index'
<<<<<<< HEAD
<<<<<<< HEAD
  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout'}
<<<<<<< HEAD
<<<<<<< HEAD
=======
  devise_for :users, path: '', 
  path_names: { sign_in: 'login', sign_out: 'logout'}, 
  :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
>>>>>>> parent of 61603b4... mutual friendship all ready in place
  
=======
>>>>>>> parent of dfbf9b1... setting up omniauth-facebook
=======
>>>>>>> parent of dfbf9b1... setting up omniauth-facebook
=======
  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout'}
>>>>>>> parent of dfbf9b1... setting up omniauth-facebook
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
    resources :friend_requests, only: :create
  end

  resources :friend_requests, only: [:index, :update, :destroy]

  resources :users do
    resources :friendships, only: [:index, :destroy]
  end
end
