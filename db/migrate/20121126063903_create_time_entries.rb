class CreateTimeEntries < ActiveRecord::Migration
  def change
    create_table :time_entries do |t|
      t.string :description
      t.integer :time

      t.timestamps
    end
  end
end
