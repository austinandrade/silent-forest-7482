Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :ingredients, only: [:show]
  resources :dishes_ingredients, only: [:update]
  resources :chefs, only: [:show] 
end
