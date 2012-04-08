class AddCodeReferenceToCategory < ActiveRecord::Migration
  def change
    add_column :categories, :code_reference, :string, :unique => true, :default => nil, :limit => 3

  end
end
