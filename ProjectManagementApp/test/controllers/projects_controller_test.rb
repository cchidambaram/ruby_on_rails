require 'test_helper'

class ProjectsControllerTest < ActionController::TestCase
   test "the truth" do
     assert true
   end
   
  setup do
    @project = projects(:Assign1)
	@user = users(:John)
	session[:user_id] = @user.id
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:projects)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create project" do
    assert_difference('Project.count') do
      post :create, project: { project_name: @project.project_name, project_description: @project.project_description, project_creator: @project.project_creator, project_manager: @project.project_manager, active: @project.active, project_created: @project.created_at }
    end  
assert_redirected_to project_path(assigns(:project))
  end

  test "should show project" do
    get :show, id: @project
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @project
    assert_response :success
  end

  test "should update project" do
    patch :update, id: @project, project: { project_name: @project.project_name, project_description: @project.project_description, project_creator: @project.project_creator, project_manager: @project.project_manager, active: @project.active, project_created: @project.created_at }
    assert_redirected_to project_path(assigns(:project))
  end

  test "should destroy project" do
    assert_difference('Project.count', -1) do
      delete :destroy, id: @project
    end

    assert_redirected_to projects_path
  end

  test "should not create project without name" do
    post :create, project: { :created_at => '2013-07-29 09:59:47', :active => 'true',  :project_manager => 'John' ,  :project_creator => 'John', :project_description => 'details', :project_name => '' }
	assert_response :success
  end

  test "should not update project with blank name" do
    patch :update, id: @project, project: {:created_at => '2013-07-29 09:59:47', :active => 'true',  :project_manager => 'John' ,  :project_creator => 'John', :project_description => 'details', :project_name => ''  }
	assert_response :success
  end
  
  test "should test the filter parameter" do
    get :index , :search => 'Assign1'
    assert_response :success
    assert_not_nil assigns(:projects)
  end

  test "require login" do
	session[:user_id] =nil
	get :index
	assert_redirected_to root_url
  end
end
