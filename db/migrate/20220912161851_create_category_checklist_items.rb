class CreateCategoryChecklistItems < ActiveRecord::Migration[7.0]
  def change
    create_table :category_checklist_items do |t|
      t.string :description
      t.boolean :state, default: false, null: false
      t.references :category_checklist, null: false, foreign_key: true

      t.timestamps
    end
  end
end
