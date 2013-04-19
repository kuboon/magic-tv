class CreatePrograms < ActiveRecord::Migration
  def change
    create_table :programs do |t|
      t.string :uid
      t.string :url
      t.string :name
      t.string :description
      t.string :start_at
      t.string :end_at

      t.timestamps
    end
    add_index :programs, :uid, :unique => true
  end
end
