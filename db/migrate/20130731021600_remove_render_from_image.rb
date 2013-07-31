class RemoveRenderFromImage < ActiveRecord::Migration
  def up
    remove_column :images, :render
  end

  def down
    add_column :images, :render, :boolean
  end
end
