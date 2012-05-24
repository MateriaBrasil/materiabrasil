class AddRenderToImage < ActiveRecord::Migration
  def change
    add_column :images, :render, :boolean
  end
end
