class HomeController < ApplicationController
  def index
    @cuisines = Cuisine.all
    @recipe_types = RecipeType.all
    @recipes = Recipe.all
  end
end
