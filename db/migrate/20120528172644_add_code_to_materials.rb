class AddCodeToMaterials < ActiveRecord::Migration
  def change
    add_column :materials, :code, :string
  end
end
