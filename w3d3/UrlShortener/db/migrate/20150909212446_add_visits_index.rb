class AddVisitsIndex < ActiveRecord::Migration
  def change
    add_index :visits, :shortened_url_id, unique: true
    add_index :visits, :user_id
  end
end
