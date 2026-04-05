class FixUserGameLibraries < ActiveRecord::Migration[7.2]
  def change
    remove_column :user_game_libraries, :game_title, :string
    remove_column :user_game_libraries, :game_id, :bigint
    remove_column :user_game_libraries, :game_price, :integer

    add_reference :user_game_libraries, :game, null: false, foreign_key: true
  end
end
