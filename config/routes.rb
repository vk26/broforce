Rails.application.routes.draw do
  root 'users#index'
  devise_for :users,
    controllers: { omniauth_callbacks: "users/omniauth_callbacks" },
    only: :omniauth_callbacks
  resource :skill
  resources :users, only: [:index] do
    resource :skill, module: 'users', only: [:show]
  end
end
