class AddUserToManufacturer < ActiveRecord::Migration
  def change
    add_column :manufacturers, :user_id, :integer
    add_index :manufacturers, :user_id
  end
end
