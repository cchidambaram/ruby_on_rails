require 'test_helper'

class AccountsControllerTest < ActionController::TestCase

  setup do
    @user = users(:John)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should destroy account" do
    get :destroy
  end

  test " forgot password" do
    get :forgot_password
  end
  
  test "should create account" do  
	  @userDavid = users (:manager2)
      post :create, :login_name => @userDavid.login_name, :password => 'asdf1234' 
	  assert_redirected_to projects_path
  end
  
   test "invalid create account" do  
	  @userDavid = users (:manager2)
      post :create, :login_name => @userDavid.login_name, :password => '1111' 
	  assert_redirected_to root_url
  end
  
  test "should get password" do
	  post :get_password , user: { login_name:@user.login_name , last_name:@user.last_name , email: @user.email }
	  assert_redirected_to root_url
  end
  
  test "should not get password" do
	  post :get_password , user: { login_name:@user.login_name , last_name:'cccc', email: @user.email }
	   assert_response :success
  end

end
