class AddPublicToContacts < ActiveRecord::Migration
  def change
    add_column :contacts, :public, :boolean, null: false, default: true
  end
end
