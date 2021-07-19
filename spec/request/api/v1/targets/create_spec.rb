require 'rails_helper'

describe 'POST api/v1/targets/', type: :request do
  subject do
    post api_v1_targets_path, params: params, headers: auth_headers, as: :json
    response
  end

  let(:user)           { create :user }
  let(:topic)          { create :topic }
  let(:target_created) { Target.last }

  context 'with valid params' do
    let(:params) do
      {
        target: {
          title: 'New target',
          topic_id: topic.id,
          longitude: -20.111111,
          latitude: -30.222222,
          radius: 150
        }
      }
    end

    it 'returns success' do
      expect(subject).to have_http_status(:success)
    end

    it 'creates the target' do
      expect {
        subject
      }.to change(Target, :count).by(1)
    end
  end

  context 'with invalid params' do
    let(:params) do
      {
        target: {
          topic_id: nil
        }
      }
    end

    it 'returns bad request' do
      expect(subject).to have_http_status(:bad_request)
    end

    it 'does not create a target' do
      expect {
        subject
      }.not_to change { Target.count }
    end
  end
end
