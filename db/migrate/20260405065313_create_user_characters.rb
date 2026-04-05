class CreateUserCharacters < ActiveRecord::Migration[7.2]
  def change
    create_table :user_characters do |t|
      t.references :user, null: false, foreign_key: true
      t.references :character_type, null: false, foreign_key: true
      t.string :name, null: false
      t.integer :friendship_point, null: false, default: 0
      t.references :outfit_item, null: true, foreign_key: true
      t.timestamps
    end
  end
end
