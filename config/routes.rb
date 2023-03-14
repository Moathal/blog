Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root 'users#index'
  resources :users, only: [:index, :show] do
    resources :posts, only: [:create, :new, :index, :show] do
      resources :likes, only: [:create]
      resources :comments, only: [:create, :destroy]
    end
    end
    resources :posts, only: [:index, :destroy]
  # Defines the root path route ("/")
  # root "articles#index"
end