class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
skip_before_action :verify_authenticity_token, only: :steam

  def steam
    puts "DEBUG: callback reached"
    @user = User.from_omniauth(request.env['omniauth.auth'])

    if @user.persisted?
      session[:user_id] = @user.id
      flash[:notice] = 'サインインに成功しました'
      redirect_to user_path(@user)
    else
      flash[:alert] = 'サインインに失敗しました'
      redirect_to root_path
    end
  end

  def failure
    redirect_to root_path
  end
end