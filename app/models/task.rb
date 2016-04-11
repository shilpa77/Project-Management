class Task < ActiveRecord::Base
  belongs_to :project
  belongs_to :user
  after_save :update_status
  
  def update_status
    Rails.logger.info("$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$")
    Rails.logger.info(self.inspect)
    if self.status.nil?
      self.update_attributes(status: "new")
    end
  end
end
