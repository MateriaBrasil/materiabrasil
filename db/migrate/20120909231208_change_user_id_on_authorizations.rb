class ChangeUserIdOnAuthorizations < ActiveRecord::Migration
  def change 
    change_column :authorizations, :user_id, :integer, null: false
  end

end
