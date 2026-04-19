class UserGameLibrary < ApplicationRecord
  belongs_to :user
  belongs_to :game

  validates :game_id, uniqueness: { scope: :user_id }
  validates :minutes_played, numericality: { greater_than_or_equal_to: 0 }

  scope :unplayed, -> { where('minutes_played <= ?', 120) }
end
