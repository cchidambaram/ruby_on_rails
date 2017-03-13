# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
connection = ActiveRecord::Base.connection();
connection.execute("delete from sqlite_sequence where name='roles';")
Role.delete_all
Role.create(:role_name => "Admin" , :role_description => "Admin Account")
Role.create(:role_name => "Manager" , :role_description => "Manager Account")
Role.create(:role_name => "Member" , :role_description => "Member Account")

connection = ActiveRecord::Base.connection();
connection.execute("delete from sqlite_sequence where name='issuepriorities';")
Issuepriority.delete_all
Issuepriority.create(:name => "High" , :description => "Requires immediate assistance ")
Issuepriority.create(:name => "Normal" , :description => "Can be done anytime but earliest is best")
Issuepriority.create(:name => "Low" , :description => "Last of all ")

connection = ActiveRecord::Base.connection();
connection.execute("delete from sqlite_sequence where name='issuestatuses';")
Issuestatus.delete_all
Issuestatus.create(:name => "created" , :description => "Issue is just created")
Issuestatus.create(:name => "Fixing" , :description => "Issue is under fixing")
Issuestatus.create(:name => "Testing" , :description => "Issue is under testing")
Issuestatus.create(:name => "review" , :description => "Issue is under review")
Issuestatus.create(:name => "resolved" , :description => "Issue is resolved")

connection = ActiveRecord::Base.connection();
connection.execute("delete from sqlite_sequence where name='users';")
User.delete_all
User.create(:role_id => "2" , :first_name => "Manager" , :last_name => "First" , :email => "projectmanagementapp@gmail.com" , :phone_no => "6088854567" , :login_name => "manager1" ,:password => "manager" , :approved => "true" , :active =>"true" )
User.create(:role_id => "2" , :first_name => "Manager" , :last_name => "Second" , :email => "projectmanagementapp@gmail.com" , :phone_no => "6088854567" , :login_name => "manager2" ,:password => "manager" , :approved => "true" , :active =>"true" )
User.create(:role_id => "3" , :first_name => "Member" , :last_name => "First" , :email => "projectmanagementapp@gmail.com" , :phone_no => "6088854567" , :login_name => "member1" ,:password => "member" , :approved => "true" , :active =>"true" )
User.create(:role_id => "3" , :first_name => "Member" , :last_name => "Second" , :email => "projectmanagementapp@gmail.com" , :phone_no => "6088854567" , :login_name => "member2" ,:password => "member" , :approved => "true" , :active =>"true" )

connection = ActiveRecord::Base.connection();
connection.execute("delete from sqlite_sequence where name='projects';")
Project.delete_all
Project.create(:project_name => "project1" ,:project_description => "project1" , :project_creator_id => "1" ,:project_manager_id => "1" ,:active => "true" , :project_created => DateTime.now )
Project.create(:project_name => "project2" ,:project_description => "project2" , :project_creator_id => "1" ,:project_manager_id => "1" ,:active => "true" , :project_created => DateTime.now )
Project.create(:project_name => "project3" ,:project_description => "project3" , :project_creator_id => "2" ,:project_manager_id => "2" ,:active => "true" , :project_created => DateTime.now )
Project.create(:project_name => "project4" ,:project_description => "project4" , :project_creator_id => "2" ,:project_manager_id => "2" ,:active => "true" , :project_created => DateTime.now )
Project.create(:project_name => "project5" ,:project_description => "project5" , :project_creator_id => "2" ,:project_manager_id => "2" ,:active => "true" , :project_created => DateTime.now )

connection = ActiveRecord::Base.connection();
connection.execute("delete from sqlite_sequence where name='issues';")
Issue.delete_all
Issue.create(:project_id => "1" , :issue_title => "Issue1" ,:issue_priority_id => "1", :issue_status_id => "1", :issue_creator_id => "1" , :issue_assigned_id => "3" ,:active => "true" , :last_updated_at => DateTime.now)
Issue.create(:project_id => "1" , :issue_title => "Issue2" ,:issue_priority_id => "1", :issue_status_id => "1", :issue_creator_id => "1" , :issue_assigned_id => "3" ,:active => "true" , :last_updated_at => DateTime.now)
Issue.create(:project_id => "1" , :issue_title => "Issue3" ,:issue_priority_id => "1", :issue_status_id => "1", :issue_creator_id => "2" , :issue_assigned_id => "4" ,:active => "true" , :last_updated_at => DateTime.now)
Issue.create(:project_id => "1" , :issue_title => "Issue4" ,:issue_priority_id => "1", :issue_status_id => "1", :issue_creator_id => "2" , :issue_assigned_id => "4" ,:active => "true" , :last_updated_at => DateTime.now)
Issue.create(:project_id => "1" , :issue_title => "Issue5" ,:issue_priority_id => "1", :issue_status_id => "1", :issue_creator_id => "2" , :issue_assigned_id => "4" ,:active => "true" , :last_updated_at => DateTime.now)
