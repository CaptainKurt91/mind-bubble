class CreateHomes < ActiveRecord::Migration[7.0]
  def change
    create_table :homes do |t|
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
