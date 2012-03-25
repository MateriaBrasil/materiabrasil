class AddCodeReferenceToCategory < ActiveRecord::Migration
  def change
    add_column :categories, :code_reference, :integer, :unique => true, :default => 0

  end
end
