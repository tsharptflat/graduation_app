class CharacterExpression < ApplicationRecord
  has_many :character_texts
  belongs_to :character_type

  validates :emotion_type, presence: true
end
