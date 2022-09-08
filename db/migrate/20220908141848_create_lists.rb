class CreateLists < ActiveRecord::Migration[7.0]
  def change
    create_table :lists do |t|
      t.string :content
      t.boolean :state
      t.references :component, null: false, foreign_key: true

      t.timestamps
    end
  end
end
