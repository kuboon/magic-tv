class AddEmailActiveToUser < ActiveRecord::Migration
  def change
    add_column :users, :email_active, :boolean, null: false, default: false
    add_index  :users, :email_active
  end
end
