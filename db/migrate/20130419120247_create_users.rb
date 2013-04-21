class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :role
      t.string :key, null: false

      t.timestamps
    end
    add_index :users, :email
    add_index :users, :key, :unique => true
  end
end
