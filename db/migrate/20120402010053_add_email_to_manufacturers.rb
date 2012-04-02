class AddEmailToManufacturers < ActiveRecord::Migration
  def change
    add_column :manufacturers, :email, :string
  end
end
