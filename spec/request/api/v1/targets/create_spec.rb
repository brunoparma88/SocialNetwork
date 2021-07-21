require 'rails_helper'

describe 'POST api/v1/targets/', type: :request do
  let(:user) { create(:user) }
  let(:topic) { create(:topic) }
  let(:target) { Target.last }

  context 'with valid params' do
    subject do
      post api_v1_targets_path, params: params, headers: auth_headers, as: :json
      response
    end

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

    it 'returns the target' do
      expect(json[:target][:title]).to eq(target.title)
      expect(json[:target][:topic_id]).to eq(target.topic_id)
      expect(json[:target][:longitude]).to eq(target.longitude)
      expect(json[:target][:latitude]).to eq(target.latitude)
      expect(json[:target][:radius]).to eq(target.radius)
    end

    it 'creates the target' do
      expect {
        subject
      }.to change(Target, :count).by(1)
    end
  end

  context 'with invalid params' do
    subject do
      post api_v1_targets_path, params: params, headers: auth_headers, as: :json
      response
    end

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

  context 'with no user logged in' do
    subject do
      post api_v1_targets_path, params: {}, as: :json
      response
    end

    it 'returns unauthorized' do
      expect(subject).to have_http_status(:unauthorized)
    end

    it 'does not create a target' do
      expect {
        subject
      }.not_to change { Target.count }
    end
  end
end
