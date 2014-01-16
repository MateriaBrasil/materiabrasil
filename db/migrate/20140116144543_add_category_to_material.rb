class AddCategoryToMaterial < ActiveRecord::Migration
  def change
    add_column :materials, :category_id, :integer
  end
end
