class User < ApplicationRecord
  has_many :user_characters, dependent: :destroy
  has_many :user_game_libraries, dependent: :destroy
  has_many :games, through: :user_game_libraries

  validates :name, presence: true
  validates :steam_id, presence: true, uniqueness: true
end
