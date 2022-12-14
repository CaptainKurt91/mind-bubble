class ChangeColumnNames < ActiveRecord::Migration[7.0]
  def change
    rename_column :category_checklists, :name, :title
    rename_column :category_checklist_items, :description, :title
    rename_column :category_notes, :name, :title
    rename_column :task_checklists, :name, :title
    rename_column :task_checklist_items, :description, :title
    rename_column :task_notes, :name, :title
    rename_column :tasks, :name, :title
  end
end
