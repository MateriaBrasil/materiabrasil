class RemoveComercialContactAndEmailAndCellphoneFromManufacturers < ActiveRecord::Migration
  def up
    remove_column :manufacturers, :comercial_contact
    remove_column :manufacturers, :email
    remove_column :manufacturers, :cellphone
  end

  def down
    add_column :manufacturers, :cellphone, :string
    add_column :manufacturers, :email, :string
    add_column :manufacturers, :comercial_contact, :string
  end
end
