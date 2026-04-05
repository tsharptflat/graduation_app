class CharacterType < ApplicationRecord
  has_many :user_characters
  has_many :character_text_conditions, dependent: :destroy
  has_many :character_expressions, dependent: :destroy
end
