class AllowNilToKeyOnUser < ActiveRecord::Migration
  def up
    change_column :users, :key, :string, null: true
  end

  def down
    change_column :users, :key, :string, null: false
  end
end
