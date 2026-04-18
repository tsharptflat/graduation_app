class AddUniqueIndexToGames < ActiveRecord::Migration[7.2]
  def change
    add_index :games, :steam_app_id, unique: true
    add_index :user_game_libraries, [:user_id, :game_id], unique: true
  end
end
