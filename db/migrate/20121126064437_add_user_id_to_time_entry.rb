class AddUserIdToTimeEntry < ActiveRecord::Migration
  def change
    add_column :time_entries, :user_id, :integer
    add_index :time_entries, :user_id
  end
end
