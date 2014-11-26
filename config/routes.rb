Rails.application.routes.draw do
  root 'users#form_data'
  devise_for :users,
    controllers: { omniauth_callbacks: "users/omniauth_callbacks" },
    only: :omniauth_callbacks
end