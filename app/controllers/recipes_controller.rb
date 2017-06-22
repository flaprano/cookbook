class RecipesController < ApplicationController
  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.create(recipe_params)
    redirect_to @recipe
  end

  def show
    id = params[:id]
    @recipe = Recipe.find(params[:id])
  end

  def recipe_params
      params.require(:recipe).permit(:title, :recipe_type, :cuisine, :difficulty, :cook_time, :ingredients, :method)
  end
end
