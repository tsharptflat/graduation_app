class UsersController < ApplicationController
  def loading
  end

  def show
    @total_price = current_user.user_game_libraries.unplayed.joins(:game).sum('games.price')
  end
end
