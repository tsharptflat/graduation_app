class Game < ApplicationRecord
  has_many :user_game_libraries, dependent: :destroy
  has_many :users, through: :user_game_libraries

  validates :game_title, presence: true
  validates :steam_app_id, presence: true, uniqueness: true
  validates :price, numericality: { greater_than_or_equal_to: 0 }
end
