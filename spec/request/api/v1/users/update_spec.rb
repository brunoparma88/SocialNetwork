require 'rails_helper'

describe 'PUT api/v1/user', type: :request do
  let(:user) { create(:user) }

  subject do
    put api_v1_user_path, params: params, headers: auth_headers, as: :json
    response
  end

  context 'with valid params' do

     let(:params) do
        {
          user: {
            uid: user.uid,
            first_name: 'FirstNameModify',
            last_name: 'LastNameModify',
            gender: 'male'
          }
        }
      end

    it 'returns success' do
      expect(subject).to have_http_status(:success)
    end

    it 'returns the user' do
      expect(json[:user][:uid]).to eq params[:user][:uid]
      expect(json[:user][:first_name]).to eq params[:user][:first_name]
      expect(json[:user][:last_name]).to eq params[:user][:last_name]
      expect(json[:user][:gender]).to eq params[:user][:gender]
    end
  end

  context 'with invalid data' do
    let(:params) { { user: { email: 'notanemail' } } }

    it 'does not return success' do
      expect(subject).to_not have_http_status(:success)
    end

    it 'returns the error' do
      expect(json[:errors][:email]).to include('is not an email')
    end
  end
end
