class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :name
      t.string :definition
      t.string :email
      t.string :phone_first
      t.string :phone_second
      t.integer :manufacturer_id

      t.timestamps
    end
  end
end
