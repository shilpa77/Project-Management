class CreateUserTasks < ActiveRecord::Migration
  def change
    create_table :user_tasks do |t|
      t.belongs_to :user
      t.belongs_to :task
      t.string :status
      t.timestamps null: false
    end
  end
end
