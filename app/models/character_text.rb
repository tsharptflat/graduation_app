class CharacterText < ApplicationRecord
  belongs_to :character_text_condition
  belongs_to :character_expression, optional: true

  validates :text, presence: true
end
