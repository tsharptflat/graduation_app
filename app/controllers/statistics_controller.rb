class StatisticsController < ApplicationController
  def show
    @user = current_user
    @unplayed_games = current_user.user_game_libraries.unplayed.includes(:game)
    @total_price = current_user.user_game_libraries.unplayed.joins(:game).sum('games.price')
    @recommended_games = current_user.user_game_libraries.unplayed.cheapest_games.recommend_3
  end
end
