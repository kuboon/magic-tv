class CreateAuths < ActiveRecord::Migration
  def change
    create_table :auths do |t|
      t.belongs_to :user
      t.string :provider, null: false
      t.string :uid, null: false
      t.text :omni_hash

      t.timestamps
    end
    add_index :auths, :user_id
    add_index :auths, [:provider, :uid], unique: true
  end
end
