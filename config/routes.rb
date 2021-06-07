Rails.application.routes.draw do
  get 'users/new'
  get 'users/create'
  #mount_devise_token_auth_for 'User', at: '/auth'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'home#index'

  resources :users, only: [:new, :create]
  get 'login', to: 'login#new'
  post 'login', to: 'login#create'
  get 'welcome', to: 'api/v1/sessions#welcome'


   #devise_for :admin_users, ActiveAdmin::Devise.config
   #ActiveAdmin.routes(self)
   mount_devise_token_auth_for 'User', at: '/api/v1/users', controllers: {
     registrations:  'api/v1/registrations',
     sessions:  'api/v1/sessions',
   }

     namespace :api do
       namespace :v1, defaults: { format: :json } do
         devise_scope :user do
           get :status, to: 'api#status'
           resources :users, only: :show
           resource :user, only: :update do
             get :profile
             controller :sessions do
               post :facebook, on: :collection
             end
           end
         end
       end
     end
   end
