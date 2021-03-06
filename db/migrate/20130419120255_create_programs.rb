class CreatePrograms < ActiveRecord::Migration
  def change
    create_table :programs do |t|
      t.integer :user_id
      t.string :uid
      t.string :url
      t.string :name, null: false
      t.string :channel
      t.text :description
      t.datetime :start_at, null: false
      t.datetime :end_at
      t.string :status
      t.integer :parent_id
      t.timestamps
    end
    add_index :programs, :user_id
    add_index :programs, :uid, :unique => true
    add_index :programs, :parent_id
    add_index :programs, :start_at
  end
end
