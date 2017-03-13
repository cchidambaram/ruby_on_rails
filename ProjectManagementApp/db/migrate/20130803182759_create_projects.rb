class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :project_name
      t.text :project_description
      t.integer :project_creator_id
      t.string :project_manager_id
      t.boolean :active
      t.datetime :created_at

      t.timestamps
    end
  end
end
