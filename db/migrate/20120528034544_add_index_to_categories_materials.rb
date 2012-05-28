class AddIndexToCategoriesMaterials < ActiveRecord::Migration
  def change
    add_index :categories_materials, [:category_id, :material_id], unique: true, name: "by_category_and_material"
  end
end
