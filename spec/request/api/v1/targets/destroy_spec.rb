describe 'DELETE api/v1/targets/:id', type: :request do
  let(:user)               { create(:user) }
  let!(:target)            { create(:target, user: user) }
  let(:other_users_target) { create(:target) }
  let(:unexisting_target)  { 0 }

  context 'for an existing target' do
    context 'when deleting an own target' do
      subject do
        delete api_v1_target_path(target.id), headers: auth_headers, as: :json
        response
      end

      it 'returns a successful response' do
        expect(subject).to have_http_status(:success)
      end

      it 'deletes the target' do
        expect { subject }.to change(user.targets, :count).by(-1)
      end
    end

    context 'when deleting other user\'s target' do
      subject do
        delete api_v1_target_path(other_users_target.id), headers: auth_headers, as: :json
        response
      end

      it 'returns not found' do
        expect(subject).to have_http_status(:not_found)
      end

      it 'does not delete the target' do
        expect { subject }.not_to change(user.targets, :count)
      end
    end
  end

  context 'for an unexisting target' do
    subject do
      delete api_v1_target_path(unexisting_target), headers: auth_headers, as: :json
      response
    end

    it 'does not return a successful response' do
      expect(subject).to have_http_status(:not_found)
    end

    it 'does not delete the target' do
      expect { subject }.not_to change(user.targets, :count)
    end
  end
end
