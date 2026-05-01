Rails.application.routes.draw do
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks'
  }
  root "static_pages#top"

  resource :user, only: %i[show destroy]

  # devise_forで生成するルーティングのうち、DELETE /users/sign_outを上書きして、HTTP DELETEリクエストを受け取るようにする
  # （今回は:database_authenticatableが不要だが、ログアウトのルーティングが生成されていないため）
  devise_scope :user do
    delete 'users/sign_out', to: 'devise/sessions#destroy', as: :destroy_user_session
  end


  resources :user_game_libraries, only: %i[] do
    collection do
      get 'loading'
    end
  end

  resource :statistic, only: %i[show]
end
