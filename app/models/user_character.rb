class UserCharacter < ApplicationRecord
  belongs_to :user
  belongs_to :character_type
  belongs_to :outfit_item, optional: true
end
