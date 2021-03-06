# frozen_string_literal: true

Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  devise_for :admin_users, ActiveAdmin::Devise.config
  resources :users, only: %i[new create]
  mount_devise_token_auth_for 'User', at: '/api/v1/users', controllers: {
    registrations: 'api/v1/registrations',
    sessions: 'api/v1/sessions'
  }

  namespace :api do
    namespace :v1, defaults: { format: :json } do
      devise_scope :user do
        get :status, to: 'api#status'
        resources :targets, only: %i[create destroy]
        resources :topics, only: :index
        resource :user, only: %i[update show] do
          controller :sessions do
            post :facebook, on: :collection
          end
        end
      end
    end
  end
end
