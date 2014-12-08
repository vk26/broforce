Rails.application.routes.draw do
  root 'users#index'
  devise_for :users,
    controllers: { omniauth_callbacks: "users/omniauth_callbacks" },
    only: :omniauth_callbacks
  devise_scope :user do
    get 'sign_out', to: 'devise/sessions#destroy', as: :destroy_user_session
  end
  resource :skill
  resources :users, only: [:index] do
    resource :skill, module: 'users', only: [:show]
  end
  resources :projects, only:[:new, :create, :edit, :delete]
end
