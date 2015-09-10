class ResetVisitsIndex < ActiveRecord::Migration
  def change
    remove_index :visits, :shortened_url_id
    add_index :visits, :shortened_url_id
  end
end
