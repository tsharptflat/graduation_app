class GameLibrariesController < ApplicationController
  def index
    steam_service = SteamService.new
    @user_game_libraries = steam_service.get_owned_games(current_user.uid)

    @user_game_libraries.each do |data|
      game = Game.find_or_create_by_steam_app_id(data['appid'], data['name'])

      library = current_user.user_game_libraries.find_or_initialize_by(game_id: game.id)
      rtime = data['rtime_last_played']

      library.minutes_played = data['playtime_forever'] || 0
      library.last_played_at = rtime && rtime > 0 ? Time.at(rtime) : nil
      library.save!

      UpdateGamePriceJob.perform_now(game.steam_app_id) if game.price.nil?
    end
    @user_game_libraries = current_user.user_game_libraries.includes(:game)
  end
end
