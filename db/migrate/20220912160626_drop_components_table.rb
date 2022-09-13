class DropComponentsTable < ActiveRecord::Migration[7.0]
  def change
    drop_table :components
  end
end
