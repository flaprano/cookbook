class RecipeTypesController < ApplicationController
  def show
    @recipe_type = RecipeType.find params[:id]
  end

  def new
    @recipe_type = RecipeType.new
  end

  def create
    @recipe_type = RecipeType.create(recipe_type_params)
    if @recipe_type.valid?
      redirect_to @recipe_type
    else
      flash[:error] = 'Você deve informar o nome do tipo de receita'
      render :new
    end

  end

  private
  def recipe_type_params
    params.require(:recipe_type).permit(:name)
  end
end
