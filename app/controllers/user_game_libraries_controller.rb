class UserGameLibrariesController < ApplicationController
  def loading
    steam_service = SteamService.new
    @user_game_libraries = steam_service.get_owned_games(current_user.uid)

    @user_game_libraries.each do |data|
      UserGameLibrary.sync_game_playtime_and_price(current_user, data)
    end
    @user_game_libraries = current_user.user_game_libraries.includes(:game)
    redirect_to user_path
  end
end
