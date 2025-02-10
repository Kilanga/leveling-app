class CreateClassProgressions < ActiveRecord::Migration[8.0]
  def change
    create_table :class_progressions do |t|
      t.references :user, null: false, foreign_key: true
      t.string :class_name
      t.integer :level_required

      t.timestamps
    end
  end
end
