class AddEndDateColumnToCategoryNotes < ActiveRecord::Migration[7.0]
  def change
    add_column :category_notes, :end_date, :date
  end
end
