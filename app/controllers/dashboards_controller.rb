class DashboardsController < ApplicationController
  before_action :authenticate_user!
  # load_and_authorize_resource
  layout 'admin'
  
  def index
    puts "*************__________________--"
    @projects = CommonMethods.user_projects(current_user)
    puts @projects.inspect
    # if current_user.role == "project_manager"
      # @projects = Project.where(managed_by: current_user.id)
    # else
      # @projects = Project.joins(:user_projects).where("user_projects.user_id" => current_user.id)
    # end
  end
end
