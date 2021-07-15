describe 'GET api/v1/topics', type: :request do
  subject do
    get api_v1_topics_path, headers: auth_headers, as: :json
    response
  end

  let(:user)    { create(:user) }
  let!(:topics) { create_list(:topic, 5, :with_avatar) }

  it 'returns all topics' do
    expect(json[:topics].map { |topic| topic[:topic][:name] })
      .to match_array(topics.pluck(:name))
  end

  it 'returns success' do
    expect(subject).to have_http_status(:success)
  end
end
