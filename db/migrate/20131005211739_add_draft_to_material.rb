class AddDraftToMaterial < ActiveRecord::Migration
  def change
    add_column :materials, :draft, :boolean, null: false, default: true
  end
end
