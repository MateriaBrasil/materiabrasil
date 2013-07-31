class RemoveUseCaseFromImage < ActiveRecord::Migration
  def up
    remove_column :images, :use_case
  end

  def down
    add_column :images, :use_case, :boolean
  end
end
