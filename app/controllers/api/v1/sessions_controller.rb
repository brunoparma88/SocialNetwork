# frozen_string_literal: true

module Api
  module V1
    class SessionsController < DeviseTokenAuth::SessionsController
      protect_from_forgery with: :null_session
      include Concerns::ActAsApiRequest

      def facebook
        user_params = FacebookService.new(params[:access_token]).profile
        @resource = User.from_social_provider 'facebook', user_params
        custom_sign_in
      rescue Koala::Facebook::AuthenticationError
        render json: { error: 'Not Authorized' }, status: :forbidden
      rescue ActiveRecord::RecordNotUnique
        render json: { error: 'User already registered with email/password' }, status: :bad_request
      end

      private

      def resource_params
        params.require(:user).permit(:email, :password)
      end

      def render_create_success
        render json: { user: resource_data }
      end

      def custom_sign_in
        sign_in(:api_v1_user, @resource)
        new_auth_header = @resource.create_new_auth_token
        response.headers.merge!(new_auth_header)
        render_create_success
      end

      def json_request?
        request.format.json?
      end
    end
  end
end
