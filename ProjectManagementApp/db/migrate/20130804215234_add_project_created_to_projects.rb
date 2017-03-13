class AddProjectCreatedToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :project_created, :datetime
  end
end
