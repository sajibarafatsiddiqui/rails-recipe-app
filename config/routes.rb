Rails.application.routes.draw do
  get 'public_recipes/index'
  devise_for :users
  devise_scope :user do
    get '/login' => 'devise/sessions#new'
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

 # Defines the root path route ("/")
  root "foods#index"
  resources :foods, only: [:index, :show, :new, :create, :destroy]
  resources :recipes, only: [:index, :show, :update] do
  resources :foods_recipes, :only=> [:new, :create, :destroy]
  end
  resources :public_recipes, only: [:index, :show]
  resources :shopping_lists, only: [:show]
  resources :public_recipes, only: [:index], controllers: 'public_recipes' 
  
  get 'general_shopping_list', to: 'pages#general_shopping_list'
 

end
