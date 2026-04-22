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
end