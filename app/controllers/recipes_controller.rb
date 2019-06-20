class RecipesController < ApplicationController

  def index
      @recipes = Recipe.all
  end

  def show
      @recipe = Recipe.find(params[:id])
  end

  def new
      @recipe = Recipe.new
      @recipe.ingredients.build(name: params[:name], quantity: params[:quantity])
      @recipe.ingredients.build(name: params[:name], quantity: params[:quantity])
  end

  def create
      recipe = Recipe.create(recipe_params)
      # binding.pry
      redirect_to recipe_path(recipe)
  end

  private

  def recipe_params
      params.require(:recipe).permit(:title, ingredients_attributes: [:name, :quantity])
  end
end
