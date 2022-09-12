class CreateCategoryChecklistItems < ActiveRecord::Migration[7.0]
  def change
    create_table :category_checklist_items do |t|
      t.string :description
      t.boolean :state
      t.references :category_checklist, null: false, foreign_key: true

      t.timestamps
    end
  end
end
