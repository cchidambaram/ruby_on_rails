class Issue < ActiveRecord::Base
  belongs_to :issue_priority, :class_name => 'Issuepriority', :foreign_key => 'issue_priority_id'
  belongs_to :issue_status, :class_name => 'Issuestatus', :foreign_key => 'issue_status_id'
  belongs_to :project  
  validates_presence_of :issue_priority, :issue_status ,:project
  belongs_to :issue_creator, :class_name => 'User', :foreign_key => 'issue_creator_id'
  belongs_to :issue_assigned, :class_name => 'User', :foreign_key => 'issue_assigned_id'
  
  def self.search(string_search)	
	Issue.where("issue_title LIKE?" ,"%#{string_search}%")		
  end
end
