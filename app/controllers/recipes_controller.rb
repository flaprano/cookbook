class RecipesController < ApplicationController
  before_action :set_collections, only: [:index, :new, :edit, :search]
  before_action :find_recipe, only: [:show, :edit, :update]

  def index
    @recipes = Recipe.all
  end

  def show
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.create recipe_params
    if @recipe.valid?
      redirect_to @recipe
    else
      set_collections
      flash.now[:error] = 'Você deve informar todos os dados da receita'
      render :new
    end
  end

  def edit
  end

  def update
    @recipe.update recipe_params
    if @recipe.valid?
      redirect_to @recipe
    else
      set_collections
      flash.now[:error] = 'Você deve informar todos os dados da receita'
      render :edit
    end
  end

  def search
    @recipes = Recipe.where("title like ?", params[:search])
  end

  private
  def recipe_params
      params.require(:recipe).permit(:title, :recipe_type_id, :cuisine_id, :difficulty, :cook_time, :ingredients, :method)
  end

  def set_collections
    @cuisines = Cuisine.all
    @recipe_types = RecipeType.all
  end

  def find_recipe
    @recipe = Recipe.find params[:id]
  end
end
