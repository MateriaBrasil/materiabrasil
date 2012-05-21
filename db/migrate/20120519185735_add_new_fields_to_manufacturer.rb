class AddNewFieldsToManufacturer < ActiveRecord::Migration
  def change
    add_column :manufacturers, :cnpj, :string
    add_column :manufacturers, :razao_social, :string
    add_column :manufacturers, :insc_estadual, :string
    add_column :manufacturers, :insc_municipal, :string
    add_column :manufacturers, :city, :string
    add_column :manufacturers, :state, :string
    add_column :manufacturers, :cep, :string
    add_column :manufacturers, :country, :string
    add_column :manufacturers, :mail_address, :string
    add_column :manufacturers, :certifications, :string
  end
end
