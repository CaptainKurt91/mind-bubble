class RemoveContentAndTypeAndDateColumnsFromTasks < ActiveRecord::Migration[7.0]
  def change
    remove_column :tasks, :type, :string
    remove_column :tasks, :content, :string
    remove_column :tasks, :date, :string
  end
end
