class SteamService
  include HTTParty
  base_uri 'https://api.steampowered.com'

  def initialize
    @api_key = ENV['STEAM_WEB_API_KEY']
  end

  def get_owned_games(steam_id)
    options = {
      query: {
        key: @api_key,
        steamid: steam_id,
        include_appinfo: true,
        include_played_free_games: true
      }
    }
    response = self.class.get('/IPlayerService/GetOwnedGames/v1/', options)

    if response.success?
      response.parsed_response.dig('response', 'games') || []
    else
      []
    end
  end
end
