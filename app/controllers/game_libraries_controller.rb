class GameLibrariesController < ApplicationController
  def index
    steam_service = SteamService.new
    @user_game_libraries = steam_service.get_owned_games(current_user.uid)
  end
end
