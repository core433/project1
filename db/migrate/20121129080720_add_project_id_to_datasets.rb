class AddProjectIdToDatasets < ActiveRecord::Migration
  def change
  	add_column :datasets, :project_id, :integer
  end
end
