class RecipesController < ApplicationController
  def new
    @recipe = Recipe.new
    @recipe_types = RecipeType.all
    @cuisines = Cuisine.all
  end

  def create
    @recipe = Recipe.create(recipe_params)
    if @recipe.valid?
      redirect_to @recipe
    else
      @recipe_types = RecipeType.all
      @cuisines = Cuisine.all
      flash[:error] = 'Você deve informar todos os dados da receita'
      render :new
    end
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def recipe_params
      params.require(:recipe).permit(:title, :recipe_type_id, :cuisine_id, :difficulty, :cook_time, :ingredients, :method)
  end
end
