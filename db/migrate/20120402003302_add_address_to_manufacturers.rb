class AddAddressToManufacturers < ActiveRecord::Migration
  def change
    add_column :manufacturers, :address, :string
  end
end
