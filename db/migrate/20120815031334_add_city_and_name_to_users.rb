class AddCityAndNameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :city, :string
    remove_column :users, :remember_created_at
  end
end
