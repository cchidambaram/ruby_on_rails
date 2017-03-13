require 'test_helper'

class UserTest < ActiveSupport::TestCase
   test "the truth" do
     assert true
   end
   
  setup do
    @user = users(:John)
  end
  
  test "create user" do
    assert User.create( :role_id => '1', :first_name =>'TestFirst', :last_name => 'TestLast' , :email => 'test@test.com' ,:phone_no => '6055555555' , :login_name => 'test' , :password => 'test' , :approved => true, :active => true )
  end
  
  test "user first name required" do
   @user.first_name = ''
   assert !@user.valid?, 'user must not be blank'  
   assert @user.errors.full_messages_for(:first_name).include? "First name can't be blank"
  end
  
  test "user last name required" do
   @user.last_name = ''
   assert !@user.valid?, 'user must not be blank'  
   assert @user.errors.full_messages_for(:last_name).include? "Last name can't be blank"
  end
  
  test "user invalid first name" do
	@user.first_name = '123'
	assert !@user.valid?, 'first name is invalid'  
    assert @user.errors.full_messages_for(:first_name).include? "First name is invalid"
  end
  
  test "user invalid last name" do
	@user.last_name = '123'
	assert !@user.valid?, 'last name is invalid'  
    assert @user.errors.full_messages_for(:last_name).include? "Last name is invalid"
  end  
  
  test "user invalid email id" do
	@user.email = 'ccc'
	assert !@user.valid?, 'user email is invalid'  
    assert @user.errors.full_messages_for(:email).include? "Email is invalid"
  end
  
  
  
end
