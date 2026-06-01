class StatisticsController < ApplicationController
  def show
    @user = current_user
    @total_price = UserGameLibrary.total_price(current_user)
    @unplayed_games = current_user.user_game_libraries.unplayed.includes(:game)# .limit(UserGameLibrary::TSUMIGE_LIST_LIMIT)
    @recommended_games = current_user.user_game_libraries.unplayed.cheapest_games.recommend_3
  end

  def update_cleared_games
    @user_game_library = current_user.user_game_libraries

    if params[:cleared_game_ids].nil? #チェックなしの場合はreturnでメソッドを強制終了
      redirect_to statistic_path, alert: 'クリア済みゲームが選択されていません。'
      return
    end

    params[:cleared_game_ids].each do |id|
      @user_game_library.find(id).update!(cleared_date: Time.current)
    end

    redirect_to statistic_path, notice: 'クリア済みゲームを更新しました。'
  rescue #update!で例外エラーが発生したときの処理 beginが省略されている rescue単体にendは不要
    redirect_to statistic_path, alert: 'クリア済みゲームの更新に失敗しました。'
  end
end
