class AddSlugIndexToMaterials < ActiveRecord::Migration
  def change
    add_column :materials, :slug, :string
    add_index :materials, :slug, unique: true
  end
end
