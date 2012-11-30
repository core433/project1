class RenameTimeEntryToViz < ActiveRecord::Migration
  def up
  	rename_table :time_entries, :vizs
  end

  def down
  	rename_table :vizs, :time_entries
  end
end
