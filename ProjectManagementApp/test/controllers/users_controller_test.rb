require 'test_helper'

class UsersControllerTest < ActionController::TestCase

  setup do    
	@user = users(:David)	
  end
  
  test "should get new" do
    get :new
    assert_response :success
  end
    
  test "should create a user" do
	assert_difference('User.count') do	
	  post :create, user: { first_name: @user.first_name , last_name: @user.last_name ,role_id: @user.role_id ,email: @user.email ,phone_no: @user.phone_no , login_name: 'abcdef' ,password: @user.password,approved: true,active: true }	  
	 end 
	assert_redirected_to root_url
  end
  
  test "should not create a user" do
    post :create, user: { first_name: @user.first_name , last_name: @user.last_name ,role_id: @user.role_id ,email: @user.email ,phone_no: @user.phone_no , login_name: @user.login_name ,password: @user.password,approved: true,active: true }	  
	assert_response :success
  end

end
