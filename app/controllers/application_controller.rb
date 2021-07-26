# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include Pundit
  include DeviseTokenAuth::Concerns::SetUserByToken

  after_action :verify_authorized,
               except: :index,
               unless: -> { :devise_controller? || :active_admin_controller? }
  after_action :verify_policy_scoped,
               only: :index,
               unless: -> { :devise_controller? || :active_admin_controller? }

  def active_admin_controller?
    is_a?(ActiveAdmin::BaseController)
  end
end
