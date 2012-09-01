class CreateAuthorizations < ActiveRecord::Migration
  def change
    create_table :authorizations do |t|
      t.string :uid
      t.string :provider
      t.string :user_id

      t.timestamps
    end
  end
end
