class CreateUserGameLibraries < ActiveRecord::Migration[7.2]
  def change
    create_table :user_game_libraries do |t|
      t.references :user, null: false, foreign_key: true
      t.string :game_title, null: false
      t.bigint :game_id, null: false
      t.float :minutes_played, null: false, default: 0.0
      t.integer :game_price, null: false, default: 0
      t.timestamps
    end

    add_index :user_game_libraries, [:user_id, :game_id], unique: true
  end
end
