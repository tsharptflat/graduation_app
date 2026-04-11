Rails.application.routes.draw do
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks'
  }
  root "static_pages#top"

  resource :user, only: %i[show]

  get 'loading', to: 'users#loading'

  resource :statistic, only: %i[show]

  resource :user_session, only: %i[new create destroy]
end
