class UserCharacter < ApplicationRecord
  belongs_to :user
  belongs_to :character_type
  belongs_to :outfit_item, optional: true

  validates :name, presence: true
  validates :friendship_point, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
