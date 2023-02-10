Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root 'users#index'
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show]
  end
  resources :posts, only: [:new, :create] do 
    resources :comments, only: [:new, :create]
  end
  resources :likes, only: [:create]
  # Defines the root path route ("/")
  # root "articles#index"
end
