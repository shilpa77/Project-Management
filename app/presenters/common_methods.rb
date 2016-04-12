class CommonMethods
  
  def self.user_projects(current_user)
    if current_user.role == "project_manager"
      Project.where(managed_by: current_user.id)
    else
      Project.joins(:user_projects).where("user_projects.user_id" => current_user.id)
    end
  end
  
end