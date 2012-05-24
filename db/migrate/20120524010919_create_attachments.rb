class CreateAttachments < ActiveRecord::Migration
  def change
    create_table :attachments do |t|
      t.string :name
      t.string :file
      t.integer :material_id

      t.timestamps
    end
  end
end
