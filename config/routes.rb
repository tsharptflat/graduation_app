Rails.application.routes.draw do
  root "static_pages#top"

  resource :users, only: %i[show]

  resource :statistics, only: %i[show]

  resource :user_sessions, only: %i[new create destroy]
end
