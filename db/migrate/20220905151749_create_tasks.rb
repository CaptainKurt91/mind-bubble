class CreateTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :tasks do |t|
      t.string :name
      t.string :type
      t.text :content
      t.date :date

      t.timestamps
    end
  end
end
