class DropInstalls < ActiveRecord::Migration[7.0]
  def change
    drop_table :category_tasks
  end
end
