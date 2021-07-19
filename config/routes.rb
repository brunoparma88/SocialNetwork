# frozen_string_literal: true

Rails.application.routes.draw do
  resources :users, only: %i[new create]
  mount_devise_token_auth_for 'User', at: '/api/v1/users', controllers: {
    registrations: 'api/v1/registrations',
    sessions: 'api/v1/sessions'
  }

  namespace :api do
    namespace :v1, defaults: { format: :json } do
      devise_scope :user do
        get :status, to: 'api#status'
        resources :targets, only: %i(create index destroy)
        resources :topics, only: :index
        resource :user, only: [] do
          controller :sessions do
            post :facebook, on: :collection
          end
        end
      end
    end
  end
end
