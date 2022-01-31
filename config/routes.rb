Rails.application.routes.draw do
  root 'users#index'
  resources :users, only: [:index]
  resources :foods, only: [:index, :new, :create, :destroy]
  resources :recipes, only: [:index, :new, :create, :show, :destroy] do
    resources :recipe_foods, only:  [:create, :destroy]
  end
  resources :public_recipes, only: [:index]
  resources :general_shopping_list, only: [:index]
end

