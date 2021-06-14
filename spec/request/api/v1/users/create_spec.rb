# frozen_string_literal: true

require 'rails_helper'

describe 'POST api/v1/users/', type: :request do

  subject do
    post user_registration_path, params: params, as: :json
    response
  end

  let(:user)            { User.last }
  let(:failed_response) { 422 }

  context 'POST create' do
    let(:email)                 { 'test2@test.com' }
    let(:password)              { '12345678' }
    let(:password_confirmation) { '12345678' }
    let(:gender)                { 'female' }

    let(:params) do
      {
        user: {
          email: email,
          password: password,
          password_confirmation: password_confirmation,
          gender: gender
        }
      }
    end

    it 'returns a successful response' do
      expect(subject).to have_http_status(:success)
    end

    it 'creates the user' do
      expect do
        subject
      end.to change(User, :count).by(1)
    end

    it 'returns the user' do
      expect(json[:user][:email]).to eq(user.email)
      expect(json[:user][:uid]).to eq(user.uid)
      expect(json[:user][:provider]).to eq('email')
      expect(json[:user][:gender]).to eq(user.gender)
    end

    context 'when the email is not correct' do
      let(:email) { 'invalid_email' }

      it 'does not create a user' do
        expect do
          subject
        end.not_to change { User.count }
      end

      it 'does not return a successful response' do
        expect(subject.status).to eq(failed_response)
      end
    end

    context 'when the password is incorrect' do
      let(:password)              { 'short' }
      let(:password_confirmation) { 'short' }
      let(:new_user)              { User.find_by(email: email) }

      it 'does not create a user' do
        expect(new_user).to be_nil
      end

      it 'does not return a successful response' do
        expect(subject.status).to eq(failed_response)
      end
    end

    context 'when passwords don\'t match' do
      let(:password)              { 'shouldmatch' }
      let(:password_confirmation) { 'dontmatch' }
      let(:new_user)              { User.find_by(email: email) }

      it 'does not create a user' do
        expect(new_user).to be_nil
      end

      it 'does not return a successful response' do
        expect(subject.status).to eq(failed_response)
      end
    end
  end
end
