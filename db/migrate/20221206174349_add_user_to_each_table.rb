class AddUserToEachTable < ActiveRecord::Migration[7.0]
  def change
    # add_reference :categories, :user, foreign_key: true
    add_reference :category_checklist_items, :user, foreign_key: true
    add_reference :category_checklists, :user, foreign_key: true
    add_reference :category_notes, :user, foreign_key: true
    add_reference :tasks, :user, foreign_key: true
    add_reference :task_checklist_items, :user, foreign_key: true
    add_reference :task_checklists, :user, foreign_key: true
    add_reference :task_notes, :user, foreign_key: true
  end
end
