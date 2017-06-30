class HomeController < ApplicationController
  before_action :set_collections, only: [:index]

  def index
    @recipes = Recipe.last(6)
  end

  private

  def set_collections
    @cuisines = Cuisine.all
    @recipe_types = RecipeType.all
  end
end
