class CharacterExpression < ApplicationRecord
  has_many :character_texts
  belongs_to :character_type
end
