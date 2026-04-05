class Game < ApplicationRecord
  has_many :user_game_libraries, dependent: :destroy
  has_many :users, through: :user_game_libraries
end
