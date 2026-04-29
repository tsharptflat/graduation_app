class UsersController < ApplicationController
  def show
    @page = 'users_show'
    @total_price = UserGameLibrary.total_price(current_user)
    @character_text = CharacterTextService.new.get_character_text(current_user, @page, @total_price)
    @character_expression = @character_text.character_expression
  end
end
