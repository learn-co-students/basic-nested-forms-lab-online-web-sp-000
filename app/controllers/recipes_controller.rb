class RecipesController < ApplicationController
  def show
    @recipe = Recipe.find(params[:id])
  end

  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
    @recipe.ingredients.build(name: "ingredient 1")
    @recipe.ingredients.build(name: "ingredient 2")
  end

  def create
    if @recipe = Recipe.create(recipe_params)
      redirect_to recipe_path(@recipe)
    else
      render :new
    end
  end

  private

  def recipe_params
    # binding.pry
    params.require(:recipe).permit(:title, 
    ingredients_attributes: [
      :name,
      :quantity
    ])
  end
end
