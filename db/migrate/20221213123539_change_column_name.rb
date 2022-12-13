class ChangeColumnName < ActiveRecord::Migration[7.0]
  def change
    rename_column :categories, :name, :title
  end
end
