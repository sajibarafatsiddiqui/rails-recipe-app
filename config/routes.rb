Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root "users#index"
  resources :foods, only: [:index, :show, :new, :create]
  resources :recipes, only: [:index, :show] do
    resources :foods_recipes, :only=> [:new, :create, :destroy]
  end
  resources :public_recipes, only: [:index, :show]
  resources :shopping_lists, only: [:show]
end
