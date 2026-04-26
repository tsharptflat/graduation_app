class ChangeIndexOnCharacterTextConditions < ActiveRecord::Migration[7.2]
  def change
    remove_index :character_text_conditions, name: 'idx_char_text_cond_on_type_page_level'
    add_index :character_text_conditions,
              [ :character_type_id, :page, :friendship_level, :min_price ],
              unique: true,
              name: 'idx_char_text_cond_on_type_page_level_price'
  end
end
