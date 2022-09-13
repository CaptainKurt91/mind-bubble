class CreateTaskNotes < ActiveRecord::Migration[7.0]
  def change
    create_table :task_notes do |t|
      t.string :name
      t.text :content
      t.date :end_date
      t.references :task, null: false, foreign_key: true

      t.timestamps
    end
  end
end
