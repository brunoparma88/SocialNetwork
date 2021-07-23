# frozen_string_literal: true

module Api
  module V1
    class UsersController < Api::V1::ApiController

      def show
      end

      def new
        @user = User.new
      end

      def update
        current_user.update!(resource_params)
        render :show
      end

      def resource_params
        params.require(:user).permit(:email, :first_name, :last_name, :gender,)
      end
    end
  end
end
