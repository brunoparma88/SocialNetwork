# frozen_string_literal: true

Rails.application.routes.draw do
  resources :users, only: %i[new create]
  mount_devise_token_auth_for 'User', at: '/api/v1/users', controllers: {
    registrations: 'api/v1/registrations',
    sessions:  'api/v1/sessions',
  }
end
