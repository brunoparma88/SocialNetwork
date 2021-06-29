# frozen_string_literal: true

describe 'POST api/v1/user/facebook', type: :request do
  let(:user)              {  create :user }
  let(:facebook_path)     { facebook_api_v1_user_path }
  let(:facebook_api_path) { 'https://graph.facebook.com/me' }
  let(:facebook_response) do
    {
      first_name: 'Open',
      last_name: 'User',
      email: 'test@facebook.com',
      id: '123456789'
    }
  end

  subject do
    post facebook_path, params: params, as: :json
    response
  end

  context 'with correct params' do
    let(:params) do
      {
        access_token: '123456'
      }
    end

    before do
      stub_request(:get, facebook_api_path)
        .with(query: hash_including(access_token: '123456', fields: 'email,first_name,last_name'))
        .to_return(status: 200, body: facebook_response.to_json)
    end

    it 'returns a successful response' do
      expect(subject).to have_http_status(:success)
    end

    it 'creates an user' do
      expect { subject }.to change(User, :count).by(1)
    end

    it 'assigns the information properly' do
      expect(json[:user][:email]).to eq('test@facebook.com')
      expect(json[:user][:first_name]).to eq('Open')
      expect(json[:user][:last_name]).to eq('User')
      expect(json[:user][:uid]).to eq('123456789')
      expect(json[:user][:provider]).to eq('facebook')
    end

    it 'returns a valid client and access token' do
      token = subject.header['access-token']
      client = subject.header['client']
      user = User.last
      expect(user.reload.valid_token?(token, client)).to be_truthy
    end
  end

  context 'without facebook email' do
    let(:params) do
      {
        access_token: 'without_email'
      }
    end

    before do
      facebook_response[:email] = ''
      stub_request(:get, facebook_api_path)
        .with(query: hash_including(access_token: 'without_email',
                                    fields: 'email,first_name,last_name'))
        .to_return(status: 200, body: facebook_response.to_json)
    end

    it 'creates an user' do
      expect { subject }.to change(User, :count).by(1)
    end
  end

  context 'the user has already logged with facebook' do
    let(:params) do
      {
        access_token: '123456'
      }
    end

    before do
      create :user, email: 'test@facebook.com', provider: 'facebook', uid: '123456789'
    end

    before do
      stub_request(:get, facebook_api_path)
        .with(query: hash_including(access_token: '123456', fields: 'email,first_name,last_name'))
        .to_return(status: 200, body: facebook_response.to_json)
    end

    it 'returns a successful response' do
      expect(subject).to have_http_status(:success)
    end

    it 'does not create an user' do
      expect { subject }.not_to change(User, :count)
    end
  end

  context 'with invalid params' do
    let(:params) do
      {
        access_token: 'invalid'
      }
    end

    before do
      facebook_response = {
        error: {
          message: 'Expired token',
          type: 'OAuthException',
          code: 190
        }
      }
      stub_request(:get, facebook_api_path)
        .with(query: hash_including(access_token: 'invalid', fields: 'email,first_name,last_name'))
        .to_return(status: 400, body: facebook_response.to_json)
    end

    it 'does not returns a successful response' do
      expect(subject).to_not have_http_status(:success)
    end

    it 'does not create an user' do
      expect { subject }.noy_to change(User, :count)
    end

    it 'shows the right error' do
      expect(json[:error]).to include 'Not Authorized'
    end
  end
end
