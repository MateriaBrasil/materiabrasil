class CreateManufacturers < ActiveRecord::Migration
  def change
    create_table :manufacturers do |t|
      t.string :name
      t.string :site
      t.string :comercial_contact
      t.string :email
      t.string :cellphone

      t.timestamps
    end
  end
end
