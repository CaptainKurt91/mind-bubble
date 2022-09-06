class AddNameColumnToComponents < ActiveRecord::Migration[7.0]
  def change
    add_column :components, :name, :string
  end
end
