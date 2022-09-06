class CreateComponents < ActiveRecord::Migration[7.0]
  def change
    create_table :components do |t|
      t.string :type
      t.text :content
      t.date :date

      t.timestamps
    end
  end
end
