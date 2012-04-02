class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :title
      t.string :description
      t.string :image
      t.integer :material_id
      t.boolean :featured
      t.boolean :use_case

      t.timestamps
    end
  end
end
