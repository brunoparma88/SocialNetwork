module Api
  module V1
    class UsersController < Api::V1::ApiController

    def new
      @user = User.new
    end

    def resource_params
      params.require(:user).permit(:email, :password,:gender, :confirm_password)
    end
  end
end
