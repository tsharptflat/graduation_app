class CreateCharacterTypes < ActiveRecord::Migration[7.2]
  def change
    create_table :character_types do |t|
      t.string :name, null: false
      t.string :image_path
      t.timestamps
    end

    add_index :character_types, :name, unique: true
  end
end
