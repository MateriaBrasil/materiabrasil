class AddPostalAddressFieldsToManufacturers < ActiveRecord::Migration
  def change
    add_column :manufacturers, :postal_address, :string
    add_column :manufacturers, :postal_city, :string
    add_column :manufacturers, :postal_state, :string
    add_column :manufacturers, :postal_cep, :string
    add_column :manufacturers, :postal_country, :string
    add_column :manufacturers, :postal_phone, :string
    add_column :manufacturers, :has_postal_address, :boolean, null: false, default: false
  end
end
