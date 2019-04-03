class RecipesController < ApplicationController
  def show
    @recipe = Recipe.find(params[:id])
  end

  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
  end

  def create
    # raise params.inspect
    @recipe = Recipe.new(recipe_params)

    if @recipe.save
      redirect_to @recipe
    else
      render :new
    end
  end


  private

    def recipe_params
      params.require(:recipe).permit(:title, :ingredients_attributes => [:ingredient_1, :ingredient_2])
    end

end
