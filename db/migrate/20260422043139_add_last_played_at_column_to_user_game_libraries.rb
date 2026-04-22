class AddLastPlayedAtColumnToUserGameLibraries < ActiveRecord::Migration[7.2]
  def change
    add_column :user_game_libraries, :last_played_at, :datetime
  end
end
