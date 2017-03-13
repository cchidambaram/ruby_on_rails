class UsersController < ApplicationController
  skip_before_filter :require_login
  layout 'account_layout' 
  def new
    @user = User.new
	@user.approved = false
	@user.active = true
  end
  
  def create
    
    @user = User.new(user_params)    
	respond_to do |format|
      if @user.save
		UserMailer.welcome_email(@user).deliver
        format.html { redirect_to root_url, notice: 'You have sucessfully signed up. Thanks for Registering.' }        
      else
        format.html { render action: 'new' }        
      end
	 end
   end
  
  
  private   

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:first_name, :last_name ,:role_id ,:email ,:phone_no , :login_name ,:password )
    end
  
end
