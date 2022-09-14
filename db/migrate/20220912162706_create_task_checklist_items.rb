class CreateTaskChecklistItems < ActiveRecord::Migration[7.0]
  def change
    create_table :task_checklist_items do |t|
      t.string :description
      t.string :state, default: false, null: false
      t.references :task_checklist, null: false, foreign_key: true

      t.timestamps
    end
  end
end
