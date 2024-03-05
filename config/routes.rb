Rails.application.routes.draw do
  get 'web/bootstrap'
  # get 'sessions/create'
  scope '/' do
    post 'login', to: 'sessions#create'
  end
  resources :users do
    get 'recipes', to: "users#recipes_index"
  end
  resources :recipes do
    get 'ingredients', to: "recipes#ingredients_index"
    get 'ingredients_and_amounts', to: "recipes#ingredients_and_amounts_index"
    get 'reviews', to: "recipes#reviews_index"
    get 'categories', to: "recipes#categories_index"
    get 'without_flour', to: "recipes#without_ingredient"
  end
  resources :categories do
    get 'recipes', to: "categories#recipes_index"
  end
  resources :ingredients do
    get 'recipes', to: "ingredients#recipes_index"
    get 'recipes_without', to: "ingredients#recipes_without_index"
  end
  resources :measurements
  resources :reviews
  resources :recipe_ingredients
end
