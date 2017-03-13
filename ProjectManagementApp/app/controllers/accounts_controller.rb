class AccountsController < ApplicationController
  skip_before_filter :require_login
  layout 'account_layout'
  def new
	@user = User.new
  end  
  
  def create    
	user = User.authenticate(params[:login_name], params[:password])
	respond_to do |format|
	  if user
		session[:user_id] = user.id		
		format.html { redirect_to projects_path}
	  else		
		format.html { redirect_to root_url, notice: 'Invalid User Name or Password !'}
	  end
	end
  end
  
  def forgot_password
	@user = User.new	
  end
  
  def get_password
	@user = User.new(user_params)    
	@verify_user = User.find_by_login_name(@user.login_name)
	if (@verify_user.last_name == @user.last_name && @verify_user.email == @user.email) 
		# Generate random password and send mail
		new_password = SecureRandom.hex(8)	
        @verify_user.password = new_password  		
		@verify_user.save!	
		UserMailer.forgot_password(@verify_user ,new_password).deliver
		redirect_to root_url, notice: 'Your new password will be mailed to you'         
    else
        render action: 'forgot_password'        
    end	
  end
  
  def destroy
	  session[:user_id] = nil
	  redirect_to root_url, :notice => "Logged out!"
  end
  
  def user_params
      params.require(:user).permit(:first_name, :last_name ,:role_id ,:email ,:phone_no , :login_name ,:password )
  end
end
