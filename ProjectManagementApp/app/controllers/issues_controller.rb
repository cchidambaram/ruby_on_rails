class IssuesController < ApplicationController
  before_action :set_issue, only: [:show, :edit, :update, :destroy]

  def index 
    if(params.has_key?(:search))
		@string_search = params[:search]  
		@issues = Issue.search(@string_search)
	else
		@issues = Issue.all
	end
	@issues = @issues.paginate(:page => params[:page], :per_page => 4)
  end

  def show	
  end

  def new
    @issue = Issue.new
	@issue.issue_creator_id = current_user.id
  end
  
  def edit    
  end

  def create
    @issue = Issue.new(issue_params)
    
    respond_to do |format|
      if @issue.save
		@user = User.where("id = #{@issue.issue_assigned_id}").first	
		
	    UserMailer.issue_assigned(@user,@issue).deliver
        format.html { redirect_to @issue, notice: 'Issue was successfully created.' }
      else
        format.html { render action: 'new' }
      end
    end
  end

  def update
    respond_to do |format|
      if @issue.update(issue_params)
        format.html { redirect_to @issue, notice: 'Issue was successfully updated.' }
      else
        format.html { render action: 'edit' }
      end
    end
  end
  
  def destroy
    @issue.destroy
    respond_to do |format|
      format.html { redirect_to issues_url }
    end
  end

  private
    def set_issue
      @issue = Issue.find(params[:id])	  
    end

    def issue_params
      params.require(:issue).permit(:project_id, :issue_title, :issue_priority_id, :issue_status_id, :issue_creator_id, :issue_assigned_id, :last_updated_at)
    end

end
