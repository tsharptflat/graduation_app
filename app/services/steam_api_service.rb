class SteamApiService
  include HTTParty
  base_uri 'https://store.steampowered.com/api'

  def get_game_price(steam_app_id)
    response = self.class.get("/appdetails", query: {
      appids: steam_app_id,
      cc: 'jp',
      filters: 'price_overview'
    })

    # 無料ゲームの場合はprice_overviewが存在しないため、nilを返す 有料の場合はハッシュが続く
    data = response.parsed_response.dig(steam_app_id.to_s, 'data')
    return nil unless data.is_a?(Hash)

    data.dig('price_overview', 'final') / 100.0
  end
end
