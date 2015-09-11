class CreatePolls < ActiveRecord::Migration
  def change
    create_table :polls do |t|
      t.string :title, presence: true
      t.integer :author_id, presence: true
      t.timestamps null: false
    end

    add_index :polls, :author_id
  end
end
