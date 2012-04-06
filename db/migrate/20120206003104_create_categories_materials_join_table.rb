class CreateCategoriesMaterialsJoinTable < ActiveRecord::Migration
  def up
    create_table :categories_materials, :id => false do |t|
      t.integer :category_id, :null => false
      t.integer :material_id, :null => false
    end
  end

  def down
    drop_table :categories_materials
  end
end
