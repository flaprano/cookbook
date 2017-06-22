class AddDetailsToRecipes < ActiveRecord::Migration[5.1]
  def change
    add_column :recipes, :ingredients, :text, :default=>nil
    add_column :recipes, :method, :text, :default=>nil
  end
end
