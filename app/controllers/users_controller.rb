class UsersController < ApplicationController
  def loading
  end

  def show
    @page = 'users_show'
    @total_price = current_user.user_game_libraries.unplayed.joins(:game).sum('games.price')
    @character_text = get_character_text(@page, @total_price)
    @character_expression = @character_text.character_expression
  end

  private

  def get_character_text(page, total_price)
    user = current_user
    user_character = user.user_characters.first
    character_type = user_character.character_type
    condition = CharacterTextCondition.where(character_type_id: character_type.id).where(page: page).where('min_price <= ? AND max_price >= ?', total_price, total_price).first
    text = condition.character_texts.first
  end
end
