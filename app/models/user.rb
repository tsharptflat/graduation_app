class User < ApplicationRecord
  has_many :user_characters, dependent: :destroy
  has_many :user_game_libraries, dependent: :destroy
  has_many :games, through: :user_game_libraries
end
