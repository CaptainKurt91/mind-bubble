class CreateCategoryChecklists < ActiveRecord::Migration[7.0]
  def change
    create_table :category_checklists do |t|
      t.string :name
      t.date :end_date
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
