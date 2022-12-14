Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root 'users#index'
  resources :users, only: [:index, :show] do
    resources :posts, only: [:create, :new, :index, :show] do
      resources :likes, only: [:create, :new]
      resources :comments, only: [:create, :new]
    end
  end
  # Defines the root path route ("/")
  # root "articles#index"
end
