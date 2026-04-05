Rails.application.routes.draw do
  root "static_pages#top"

  resource :user, only: %i[show]

  resource :statistic, only: %i[show]

  resource :user_session, only: %i[new create destroy]
end
