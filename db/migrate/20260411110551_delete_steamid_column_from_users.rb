class DeleteSteamidColumnFromUsers < ActiveRecord::Migration[7.2]
  def up
    remove_column :users, :steam_id, :string
  end

  def down
    add_column :users, :steam_id, :string
    add_index :users, :steam_id, unique: true
  end
end
