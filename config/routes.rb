Rails.application.routes.draw do

  get "recipes", to: "recipes#index", as: :recipes

  get "recipes/new", to: "recipes#new", as: :new_recipe

  post "recipes", to: "recipes#create"

  get "recipes/:id", to: "recipes#show", as: :recipe

end
