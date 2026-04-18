class UpdateGamePriceJob < ApplicationJob
  queue_as :default

  def perform(steam_app_id)
    game = Game.find_by(steam_app_id: steam_app_id)
    return unless game

    price = SteamApiService.new.get_game_price(steam_app_id)
    game.update(price: price)
  end
end
