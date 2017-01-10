class AddStatsToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :xp, :integer
    add_column :users, :attack, :integer
    add_column :users, :defense, :integer
    add_column :users, :health, :integer
    add_column :users, :mana, :integer
  end
end
