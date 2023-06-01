Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root "users#index"

  resources :recipes, only: [:index, :show]
  resources :inventories
  resources :public_recipes, only: [:index, :show]
  resources :shopping_lists, only: [:index, :show]
  get "/shopping_lists?recipe_id=3&inventory_id=6", to: 'shopping_list#show'
end
