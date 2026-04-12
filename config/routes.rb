Rails.application.routes.draw do
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks'
  }
  root "static_pages#top"

  resource :user, only: %i[show]

  resources :game_libraries, only: %i[index]

  #devise_forで生成するルーティングのうち、DELETE /users/sign_outを上書きして、HTTP DELETEリクエストを受け取るようにする
  #（今回は:database_authenticatableが不要だが、ログアウトのルーティングが生成されていないため）
  devise_scope :user do
    delete 'users/sign_out', to: 'devise/sessions#destroy', as: :destroy_user_session
  end

  get 'loading', to: 'users#loading'

  resource :statistic, only: %i[show]
end
