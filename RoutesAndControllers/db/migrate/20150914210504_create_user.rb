class CreateUser < ActiveRecord::Migration

  def change
    create_table :users do |t|
      t.string :username, presence: true

      t.timestamp
    end
  end
end
