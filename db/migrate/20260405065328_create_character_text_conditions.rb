class CreateCharacterTextConditions < ActiveRecord::Migration[7.2]
  def change
    create_table :character_text_conditions do |t|
      t.references :character_type, null: false, foreign_key: true
      t.integer :page, null: false
      t.integer :friendship_level, null: false, default: 1
      t.timestamps
    end

    add_index :character_text_conditions,
              [:character_type_id, :page, :friendship_level],
              unique: true,
              name: 'idx_char_text_cond_on_type_page_level'
  end
end
