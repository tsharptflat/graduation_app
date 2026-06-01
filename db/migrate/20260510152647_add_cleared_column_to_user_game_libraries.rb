class AddClearedColumnToUserGameLibraries < ActiveRecord::Migration[7.2]
  def change
    add_column :user_game_libraries, :cleared_date, :date
  end
end
