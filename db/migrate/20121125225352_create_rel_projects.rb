class CreateRelProjects < ActiveRecord::Migration
  def change
    create_table :rel_projects do |t|
      t.integer :user_id
      t.integer :project_id

      t.timestamps
    end

    add_index :rel_projects, :user_id
    add_index :rel_projects, :project_id
    add_index :rel_projects, [:user_id, :project_id], unique: true

  end
end
