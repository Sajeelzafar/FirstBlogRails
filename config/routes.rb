Rails.application.routes.draw do
  
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    passwords: 'users/passwords'
  }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root 'users#index'
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show, :new, :create, :destroy] do
      resources :comments, only: [:create, :new, :destroy]
      resources :likes, only: [:create]
    end
  end
  # Defines the root path route ("/")
  # root "articles#index"
end
