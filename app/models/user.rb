class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  has_many :user_projects
  has_many :projects, through: :user_projects
  has_many :tasks
  module Roles
    Rails.logger.info("###############3inside module")
    PROJ_MNGR = 'project_manager'
    DEVELPOER = 'developer'
  end
  
end
