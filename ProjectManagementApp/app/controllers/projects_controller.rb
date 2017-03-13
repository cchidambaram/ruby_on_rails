class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]

  def index 
    if(params.has_key?(:search))
		@string_search = params[:search]  
		@projects = Project.search(@string_search)
	else
		@projects = Project.all
	end
	@projects = @projects.paginate(:page => params[:page], :per_page => 4)
  end

  def show    
  end

  def new
    @project = Project.new
	@project.project_creator_id = current_user.id		
  end
  
  def edit    
  end

  def create
    @project = Project.new(project_params)	
    respond_to do |format|
      if @project.save
        format.html { redirect_to @project, notice: 'Project was successfully created.' }
      else
        format.html { render action: 'new' }
      end
    end
  end

  def update
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to @project, notice: 'Project was successfully updated.' }
      else
        format.html { render action: 'edit' }
      end
    end
  end
  
  def destroy
    @project.destroy
    respond_to do |format|
      format.html { redirect_to projects_url }
    end
  end

  private
    def set_project
      @project = Project.find(params[:id])
    end

    def project_params
      params.require(:project).permit(:project_name, :project_description, :project_creator_id, :project_manager_id ,:project_created )
    end


end
