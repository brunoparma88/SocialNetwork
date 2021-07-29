# frozen_string_literal: true

module Api
  module Concerns
    # Api request
    module ActAsApiRequest
      extend ActiveSupport::Concern

      included do
        skip_before_action :verify_authenticity_token
        before_action :skip_session_storage
        before_action :check_json_request
      end

      def check_json_request
        return if request.content_type.match?(/json/)

        render json: { error: I18n.t('api.errors.invalid_content_type') }, status: :not_acceptable
      end

      def skip_session_storage
        request.session_options[:skip] = true
      end

      def render_error(status, message, _data = nil)
        response = {
          error: message
        }
        render json: response, status: status
      end
    end
  end
end
