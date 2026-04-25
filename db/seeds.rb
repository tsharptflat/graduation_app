# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

character_type = CharacterType.find_or_create_by!(name: 'いらすと子') do |ct|
  ct.image_path = 'https://res.cloudinary.com/dvswzgioa/image/upload/q_auto/f_auto/v1777086275/business_woman1_1_smile_ujoauq.png'
end

character_text_condition = CharacterTextCondition.find_or_create_by!(character_type_id: character_type.id, page: 'users_show', friendship_level: 1) do |ctc|
  ctc.min_price = 10000
  ctc.max_price = 30000
end

character_expression = CharacterExpression.find_or_create_by!(character_type_id: character_type.id, emotion_type: 'neutral') do |ce|
  ce.image_path = 'https://res.cloudinary.com/dvswzgioa/image/upload/q_auto/f_auto/v1777086275/business_woman1_1_smile_ujoauq.png'
end

CharacterText.find_or_create_by!(character_text_condition_id: character_type_condition.id, character_expression_id: character_expression.id) do |ct|
  ct.text = 'テストですよ！'
end

user = User.find(3)

UserCharacter.find_or_create_by!(user_id: user.id, character_type_id: character_type.id) do |uc|
  uc.name = 'ユーザー命名'
  uc.friendship_point = 0
  uc.outfit_item_id = nil
end