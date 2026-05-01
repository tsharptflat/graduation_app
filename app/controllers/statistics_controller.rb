class StatisticsController < ApplicationController
  def show
    @user = current_user
    @total_price = UserGameLibrary.total_price(current_user)
    @unplayed_games = current_user.user_game_libraries.unplayed.includes(:game)# .limit(UserGameLibrary::TSUMIGE_LIST_LIMIT)
    @recommended_games = current_user.user_game_libraries.unplayed.cheapest_games.recommend_3
  end
end
