class AddFieldsToMaterial < ActiveRecord::Migration
  def change
    add_column :materials, :ncm, :string
    add_column :materials, :certifications, :string
    add_column :materials, :awards, :string
  end
end
