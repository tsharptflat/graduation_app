class CreateGames < ActiveRecord::Migration[7.2]
  def change
    create_table :games do |t|
      t.string :game_title
      t.integer :steam_app_id
      t.integer :price

      t.timestamps
    end
  end
end
