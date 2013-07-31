class RemovePackingFromMaterial < ActiveRecord::Migration
  def up
    remove_column :materials, :packing
  end

  def down
    add_column :materials, :packing, :string
  end
end
