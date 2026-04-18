class Game < ApplicationRecord
  has_many :user_game_libraries, dependent: :destroy
  has_many :users, through: :user_game_libraries

  validates :game_title, presence: true
  validates :steam_app_id, presence: true, uniqueness: true
  validates :price, numericality: { greater_than_or_equal_to: 0 }, allow_nil: true

  def self.find_or_create_by_steam_app_id(steam_app_id, game_title)
    game = Game.find_or_create_by(steam_app_id: steam_app_id) do |g|
      g.game_title = game_title
      g.price = nil
    end
    game
  end
end
