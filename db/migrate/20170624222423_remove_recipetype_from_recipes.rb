class RemoveRecipetypeFromRecipes < ActiveRecord::Migration[5.1]
  def change
    remove_column :recipes, :recipe_type, :string
    remove_column :recipes, :recype_type, :string
  end
end
