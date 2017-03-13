class Project < ActiveRecord::Base
  has_many:issue
  belongs_to :project_creator, :class_name => 'User', :foreign_key => 'project_creator_id'
  belongs_to :project_manager, :class_name => 'User', :foreign_key => 'project_manager_id'
  validates_presence_of :project_name, :project_description
  
  def self.search(string_search)	
	Project.where("project_name LIKE?" ,"%#{string_search}%")		
  end
end
