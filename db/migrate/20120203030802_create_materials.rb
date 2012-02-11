class CreateMaterials < ActiveRecord::Migration
  def change
    create_table :materials do |t|
      t.text :resume
      t.integer :manufacturer_id
      t.text :technical_observation
      t.string :density
      t.string :dimensions
      t.string :packing
      t.string :average_price

      t.timestamps
    end
  end
end
