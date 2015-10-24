class CreateContact < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :name, presence: true
      t.string :email, presence: true
      t.integer :user_id, presence: true

      t.timestamp
    end
    add_index :contacts, [:name, :email], unique: true
    add_index :contacts, :user_id
  end
end
