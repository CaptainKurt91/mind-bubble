class AddReferenceColumnToComponents < ActiveRecord::Migration[7.0]
  def change
    add_reference :components, :task, null: false, foreign_key: true
  end
end
