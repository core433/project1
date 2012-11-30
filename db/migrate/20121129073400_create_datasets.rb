class CreateDatasets < ActiveRecord::Migration
  def change
    create_table :datasets do |t|
      t.string :name

      t.timestamps
    end

    add_index :datasets, :name
  end
end
