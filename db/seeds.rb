# character_type
character_type = CharacterType.find_or_create_by!(name: 'いらすと子') do |ct|
  ct.image_path = 'https://res.cloudinary.com/dvswzgioa/image/upload/q_auto/f_auto/v1777086275/business_woman1_1_smile_ujoauq.png'
end

# 総額ごとのconditions
condition_show_min = CharacterTextCondition.find_or_create_by!(character_type_id: character_type.id, page: 'users_show', friendship_level: 1, min_price: 0, max_price: 0)

condition_show_low = CharacterTextCondition.find_or_create_by!(character_type_id: character_type.id, page: 'users_show', friendship_level: 1, min_price: 1, max_price: 5000)

condition_show_med = CharacterTextCondition.find_or_create_by!(character_type_id: character_type.id, page: 'users_show', friendship_level: 1, min_price: 5001, max_price: 10000)

condition_show_high = CharacterTextCondition.find_or_create_by!(character_type_id: character_type.id, page: 'users_show', friendship_level: 1, min_price: 10001, max_price: 30000)

condition_show_max = CharacterTextCondition.find_or_create_by!(character_type_id: character_type.id, page: 'users_show', friendship_level: 1, min_price: 30001, max_price: nil)

# 表情差分
expression_neutral = CharacterExpression.find_or_create_by!(character_type_id: character_type.id, emotion_type: 'neutral') do |ce|
  ce.image_path = 'https://res.cloudinary.com/dvswzgioa/image/upload/q_auto/f_auto/v1777086275/business_woman1_1_smile_ujoauq.png'
end

expression_happy = CharacterExpression.find_or_create_by!(character_type_id: character_type.id, emotion_type: 'happy') do |ce|
  ce.image_path = 'https://res.cloudinary.com/dvswzgioa/image/upload/q_auto/f_auto/v1777086275/business_woman1_4_laugh_nkgkla.png'
end

expression_surprised = CharacterExpression.find_or_create_by!(character_type_id: character_type.id, emotion_type: 'surprised') do |ce|
  ce.image_path = 'https://res.cloudinary.com/dvswzgioa/image/upload/q_auto/f_auto/v1777086276/business_woman2_3_surprise_ss4wsg.png'
end

expression_disappointed = CharacterExpression.find_or_create_by!(character_type_id: character_type.id, emotion_type: 'disappointed') do |ce|
  ce.image_path = 'https://res.cloudinary.com/dvswzgioa/image/upload/q_auto/f_auto/v1777086276/business_woman2_4_think_cqlpap.png'
end

expression_shock = CharacterExpression.find_or_create_by!(character_type_id: character_type.id, emotion_type: 'shock') do |ce|
  ce.image_path = 'https://res.cloudinary.com/dvswzgioa/image/upload/q_auto/f_auto/v1777086275/business_woman2_2_shock_nmiaai.png'
end

# テキスト
CharacterText.find_or_create_by!(character_text_condition_id: condition_show_min.id, character_expression_id: expression_happy.id) do |ct|
  ct.text = '積みゲーなし！素晴らしいですね！'
end

CharacterText.find_or_create_by!(character_text_condition_id: condition_show_low.id, character_expression_id: expression_neutral.id) do |ct|
  ct.text = 'いい消化状況ですね！増やさないように注意していきましょう！'
end

CharacterText.find_or_create_by!(character_text_condition_id: condition_show_med.id, character_expression_id: expression_neutral.id) do |ct|
  ct.text = '少し積んでいるゲームもあるようですね、次にどれをプレイしていきますか？'
end

CharacterText.find_or_create_by!(character_text_condition_id: condition_show_high.id, character_expression_id: expression_disappointed.id) do |ct|
  ct.text = '少し積みゲーが多いようですね…ここからプレイしていきましょう！'
end

CharacterText.find_or_create_by!(character_text_condition_id: condition_show_max.id, character_expression_id: expression_shock.id) do |ct|
  ct.text = '…'
end

=begin
#ユーザー指定
user = User.find_or_create_by(uid: '76561198369759270')

#ユーザーキャラ
UserCharacter.find_or_create_by!(user_id: user.id, character_type_id: character_type.id) do |uc|
  uc.name = 'ユーザー命名'
  uc.friendship_point = 0
  uc.outfit_item_id = nil
end
=end
