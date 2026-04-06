class CharacterTextCondition < ApplicationRecord
  belongs_to :character_type
  has_many :character_texts, dependent: :destroy

  validates :page, presence: true
  validates :friendship_level, numericality: { only_integer: true, greater_than_or_equal_to: 1 }
end
