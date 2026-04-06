class OutfitItem < ApplicationRecord
  has_many :user_characters

  validates :name, presence: true
  validates :description, presence: true
  validates :image_path, presence: true
end
