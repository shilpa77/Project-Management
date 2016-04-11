class AddColumnToTasks < ActiveRecord::Migration
  def change
    add_column :tasks , :user_id , :integer
    add_column :tasks, :status, :string
  end
end
