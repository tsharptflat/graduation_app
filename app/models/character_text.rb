class CharacterText < ApplicationRecord
  belongs_to :character_text_condition
  belongs_to :character_expression, dependent: :destroy
end
