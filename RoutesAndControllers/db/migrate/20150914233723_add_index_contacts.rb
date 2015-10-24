class AddIndexContacts < ActiveRecord::Migration
  def change
    remove_index :contacts, [:name, :email]
    add_index :contacts, [:user_id, :email], unique: true
  end
end
