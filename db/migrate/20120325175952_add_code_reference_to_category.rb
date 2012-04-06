class AddCodeReferenceToCategory < ActiveRecord::Migration
  def change
    add_column :categories, :code_reference, :text, :unique => true, :default => nil

  end
end
