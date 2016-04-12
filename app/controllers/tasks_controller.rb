class TasksController < ApplicationController
  before_action :authenticate_user!
  # load_and_authorize_resource
  layout 'admin'
  
  def index
    if current_user.role == "project_manager"
      @tasks = Task.where(project_id: params["project_id"])
    else
      @tasks = Task.where("project_id =? and user_id = ?", params["project_id"], current_user.id)
    end
    
  end
  
  def show
    @task = Task.find_by_id(params['id'])
  end
  
  def new
    @project = Project.find_by_id(params[:id])
  end
  
  def create
    project = Project.find_by_id(params['project']['project_id'])
    if project.update_attributes(task_params)
      task_count = task_params['tasks_attributes'].keys.count
      flash[:success] = "Task created successfully"
      redirect_to projects_path
    else
      flash[:danger] = project.errors.full_messages[0]
      render("new")
    end
  end
  
  def update_status
    task = Task.find(params["task_id"])
    task.update_attributes(status: params["status"])
    respond_to do |format|
      format.js
    end
  end
  
  private
    def task_params
      params.require(:project).permit(tasks_attributes: [:id, :description, :user_id, :_destroy])
    end
end
