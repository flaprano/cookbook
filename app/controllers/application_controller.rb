class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_collections
  
  private
  
  def set_collections
    @cuisines = Cuisine.all
    @recipe_types = RecipeType.all
  end
end
