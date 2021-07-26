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

    it 'updates the first_name' do
      expect { subject }.to change {
                              user.reload.first_name
                            }.from(user.first_name).to('FirstNameModify')
    end

    it 'updates the last_name' do
      expect { subject }.to change {
                              user.reload.last_name
                            }.from(user.last_name).to('LastNameModify')
    end

    it 'updates the gender' do
      expect { subject }.to change { user.reload.gender }.from(user.gender).to('male')
    end

    it 'returns the user' do
      expect(json[:user][:uid]).to eq params[:user][:uid]
      expect(json[:user][:first_name]).to eq params[:user][:first_name]
      expect(json[:user][:last_name]).to eq params[:user][:last_name]
      expect(json[:user][:gender]).to eq params[:user][:gender]
    end
  end

  context 'with invalid params' do
    let(:params) { { user: { email: 'emailFail' } } }

    it 'returns bad request' do
      expect(subject).to have_http_status(:bad_request)
    end

    it 'returns the error' do
      expect(json[:errors][:email]).to include('is not an email')
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

    it 'does not update the gender' do
      expect { subject }.not_to change { user.reload.gender }
    end

    it 'does not update the first_name' do
      expect { subject }.not_to change { user.reload.first_name }
    end

    it 'does not update the last_name' do
      expect { subject }.not_to change { user.reload.last_name }
    end
  end
end
