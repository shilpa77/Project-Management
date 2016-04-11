class ProjectsController < ApplicationController
  before_action :authenticate_user!
  
  layout 'admin'
  
  def index
    puts "*************************"
    puts user_signed_in?
    @projects = Project.all
  end
  
  def show
    @project = Project.find_by_id(params['id'])
  end
  
  def new
    @project = Project.new
  end
  
  def create
    project = Project.new(project_params)
    if project.save!
      project.update_attributes(managed_by: current_user.id)
      flash[:success] = "Project details created successfully"
      redirect_to projects_path
    else
      flash[:danger] = project.errors.full_messages[0]
      render("new")
    end
  end
  
  def add_developer
    @developers = User.where(:role => "developer")
    @project = Project.find_by_id(params['id'])
  end
  
  def assign_developers
    puts "*******##########################"
    puts params
    params['developer'].each do |dev_id|
      user_project = UserProject.create(project_id: params['project_id'], user_id: dev_id)
    end
    redirect_to projects_path
  end
  
  private
    def project_params
      params.require(:project).permit(:name, :description)
    end
end
