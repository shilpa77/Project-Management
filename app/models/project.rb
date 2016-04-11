class Project < ActiveRecord::Base
  has_many :tasks
  has_many :user_projects
  has_many :users, through: :user_projects
  accepts_nested_attributes_for :tasks, allow_destroy: true
end
