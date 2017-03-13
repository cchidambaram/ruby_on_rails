class UserMailer < ActionMailer::Base
  default from: "ProjectManagementApp@gmail.com"
  
  def welcome_email(user)
    @user = user    
    mail(to: @user.email, subject: 'Welcome to Project Management Application')
  end
  
  def forgot_password(user,password )
	@user = user  
	@password = password
	mail(to: @user.email, subject: 'Project Management Application :  Password Reset')
  end
  
  def issue_assigned(user,issue)
	@user = user
	@issue =issue
	mail(to: @user.email, subject: 'Project Management Application : Issue Assigned')
  end
end
