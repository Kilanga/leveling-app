class CreateAchievements < ActiveRecord::Migration[8.0]
  def change
    create_table :achievements do |t|
      t.string :title
      t.string :condition
      t.references :user, null: false, foreign_key: true
      t.boolean :unlocked

      t.timestamps
    end
  end
end
