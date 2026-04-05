class CharacterTextCondition < ApplicationRecord
  belongs_to :character_type
  has_many :character_texts, dependent: :destroy
end
