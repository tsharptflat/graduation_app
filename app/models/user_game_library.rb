class UserGameLibrary < ApplicationRecord
  belongs_to :user
  belongs_to :game

  validates :game_id, uniqueness: { scope: :user_id }
  validates :minutes_played, numericality: { greater_than_or_equal_to: 0 }

  scope :not_recently_played, -> { where(last_played_at: nil).or(where('last_played_at < ?', 1.month.ago)) }
  scope :unplayed, -> { where('minutes_played <= ?', 120).merge(not_recently_played) }
  scope :cheapest_games, -> { joins(:game).merge(Game.order(price: 'asc')).limit(10) }

  def self.recommend_3
    all.to_a.sample(3)
  end

  def self.sync_game_playtime_and_price(user, data)
    game = nil #トランザクションブロックの中から代入、ジョブにて被参照
    ActiveRecord::Base.transaction do
      game = Game.find_or_create_by_steam_app_id(data['appid'], data['name'])

      library = user.user_game_libraries.find_or_initialize_by(game_id: game.id)
      rtime = data['rtime_last_played']

      library.minutes_played = data['playtime_forever'] || 0
      library.last_played_at = rtime && rtime > 0 ? Time.at(rtime) : nil
      library.save!
    end
    UpdateGamePriceJob.perform_now(game.steam_app_id) if game.price.nil?
  end
end
