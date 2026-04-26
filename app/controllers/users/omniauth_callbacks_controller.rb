class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  skip_before_action :verify_authenticity_token, only: :steam

  def steam
    @user = User.from_omniauth(request.env['omniauth.auth'])

    if @user.persisted?
      sign_in(:user, @user)
      UserCharacter.find_or_create_by!(user_id: @user.id, character_type_id: CharacterType.find_by(name: 'いらすと子').id) do |uc|
        uc.name = '仮'
      end
      redirect_to after_sign_in_path_for(@user)
    else
      redirect_to root_path, alert: @user.errors.full_messages.join("\n")
    end
  end

  def failure
    redirect_to root_path
  end
end
