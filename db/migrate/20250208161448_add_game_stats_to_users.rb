class AddGameStatsToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :level, :integer, default: 1, null: false
    add_column :users, :xp, :integer, default: 0, null: false
    add_column :users, :coins, :integer, default: 0, null: false
    add_column :users, :quests_completed, :integer, default: 0, null: false
  end
end
