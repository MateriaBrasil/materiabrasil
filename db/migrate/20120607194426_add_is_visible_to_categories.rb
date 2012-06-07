class AddIsVisibleToCategories < ActiveRecord::Migration
  def change
    add_column :categories, :is_visible, :boolean
  end
end
