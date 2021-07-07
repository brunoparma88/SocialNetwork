module Api
  module V1
    class TopicsController < Api::V1::ApiController
      def index
        @topics = Topic.get_all
      end
    end
  end
end
