class CreateFirebaseUsers < ActiveRecord::Migration[8.0]
  def change
    create_table :firebase_users do |t|
      t.string :uid
      t.string :email
      t.string :display_name
      t.integer :xp
      t.integer :level
      t.jsonb :stats

      t.timestamps
    end
  end
end
