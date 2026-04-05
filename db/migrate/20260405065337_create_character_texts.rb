class CreateCharacterTexts < ActiveRecord::Migration[7.2]
  def change
    create_table :character_texts do |t|
      t.references :character_text_condition, null: false, foreign_key: true
      t.references :character_expression, null: true, foreign_key: true
      t.text :text, null: false
      t.timestamps
    end
  end
end
