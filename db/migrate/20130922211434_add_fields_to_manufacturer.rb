class AddFieldsToManufacturer < ActiveRecord::Migration
  def change
    add_column :manufacturers, :phone, :string
    add_column :manufacturers, :image, :string
    add_column :manufacturers, :description, :text
    add_column :manufacturers, :forum, :boolean, null: false, default: false
    add_column :manufacturers, :forum_mail, :string
  end
end
