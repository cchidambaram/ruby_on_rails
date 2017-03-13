require 'test_helper'

class IssuesControllerTest < ActionController::TestCase
   test "the truth" do
     assert true
   end
   
  setup do
    @issue = issues(:Issue1)
	@user = users(:John)
	session[:user_id] = @user.id
  end

   test "should get index" do    
    get :index    	
    assert_not_nil assigns(:issues)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should show issue" do
    get :show, id: @issue
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @issue
    assert_response :success
  end

  test "should destroy issue" do
    assert_difference('Issue.count', -1) do
      delete :destroy, id: @issue
    end
  end
  
  test "should create issue" do
    assert_difference('Issue.count') do
      post :create, issue: { project_id: @issue.project_id , issue_title: @issue.issue_title , issue_priority_id: @issue.issue_priority_id, issue_status_id: @issue.issue_status_id, issue_creator_id: @issue.issue_creator_id, issue_assigned_id: @issue.issue_assigned_id, last_updated_at: @issue.issue_assigned_id}
    end  
	assert_redirected_to issue_path(assigns(:issue))
  end

  test "should update issue" do
    patch :update, id: @issue, issue: { project_id: @issue.project_id , issue_title: @issue.issue_title , issue_priority_id: @issue.issue_priority_id, issue_status_id: @issue.issue_status_id, issue_creator_id: @issue.issue_creator_id, issue_assigned_id: @issue.issue_assigned_id, last_updated_at: @issue.issue_assigned_id }
    assert_redirected_to issue_path(assigns(:issue))
  end

  test "should not create issue without title" do
    post :create, issue: { :issue_title => '' , :project_id  => 'project1' , :issue_priority_id => '1' , :issue_status_id => '1' , :issue_creator_id => '1' , :issue_assigned_id => '1' , :active => 'true' , :last_updated_at => '2013-08-08' , :created_at => '2013-08-08' }
	assert_response :success
  end

  test "should not update issue with blank title" do
    patch :update, id: @issue, issue: {:issue_title => '' , :project_id  => 'project1' , :issue_priority_id => '1' , :issue_status_id => '1' , :issue_creator_id => '1' , :issue_assigned_id => '1' , :active => 'true' , :last_updated_at => '2013-08-08' , :created_at => '2013-08-08'  }
	assert_response :success
  end 

  test "should test the filter parameter" do
    get :index , :search => 'Bugs1'
    assert_response :success
    assert_not_nil assigns(:issues)
  end

end

