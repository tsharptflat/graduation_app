class CharacterTextService
  def get_character_text(user, page, total_price)
    user_character = user.user_characters.first
    character_type = user_character.character_type
    condition = CharacterTextCondition.where(character_type_id: character_type.id).where(page: page).where('min_price <= ? AND (max_price IS NULL OR max_price >= ? )', total_price, total_price).first
    text = condition.character_texts.first
  end
end
