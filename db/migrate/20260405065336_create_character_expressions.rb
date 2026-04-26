class CreateCharacterExpressions < ActiveRecord::Migration[7.2]
  def change
    create_table :character_expressions do |t|
      t.references :character_type, null: false, foreign_key: true
      t.string :emotion_type, null: false
      t.string :image_path, null: false
      t.timestamps
    end

    add_index :character_expressions, [ :character_type_id, :emotion_type ], unique: true, name: 'idx_char_expressions_on_type_and_emotion'
  end
end
