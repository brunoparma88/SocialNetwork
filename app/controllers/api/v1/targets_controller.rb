module Api
  module V1
    class TargetsController < Api::V1::ApiController
      def create
        @target = current_user.targets.create!(targets_params)
      end

      private

      def target_attrs
        %i[title latitude longitude radius topic_id]
      end

      def targets_params
        params.require(:target).permit(*target_attrs)
      end
    end
  end
end
