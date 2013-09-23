class AddFieldToContact < ActiveRecord::Migration
  def change
    add_column :contacts, :rescrict, :boolean
  end
end
