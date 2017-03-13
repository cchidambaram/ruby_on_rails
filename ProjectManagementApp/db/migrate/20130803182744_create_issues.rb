class CreateIssues < ActiveRecord::Migration
  def change
    create_table :issues do |t|
      t.integer :project_id
      t.string :issue_title
      t.integer :issue_priority_id
      t.integer :issue_status_id
      t.integer :issue_creator_id
      t.integer :issue_assigned_id
      t.boolean :active
      t.datetime :created_at
      t.datetime :last_updated_at

      t.timestamps
    end
  end
end
