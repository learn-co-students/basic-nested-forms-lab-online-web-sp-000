class RecipesController < ApplicationController
  def show
    @recipe = Recipe.find(params[:id])
  end

  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
    @recipe.ingredients.build 
    @recipe.ingredients.build
  end

  def create
    @recipe = Recipe.create(recipe_params(recipe_keys, ingredient_keys))
    redirect_to @recipe
  end

  private
    def recipe_params(recipe, ingredient)
      params.require(:recipe).permit(recipe, ingredients_attributes: ingredient)
    end

end
