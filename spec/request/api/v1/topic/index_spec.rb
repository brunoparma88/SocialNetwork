require 'rails_helper'

describe 'GET api/v1/topics', type: :request do

  subject do
    get api_v1_topics_path, headers: auth_headers, as: :json
    response
  end

  let(:filename) { 'generic-logo.png' }
  let(:file) do
    {
      io: File.open(
        File.expand_path(File.join(File.dirname(__FILE__)+'/../../../..', 'fixtures', filename))
      ),
      filename: filename
    }
  end

  let(:user)    { create :user }
  let!(:topics) { create_list :topic, 5 }
  let!(:topic) { Topic.last  }

  it 'returns all topics' do
    expect(json[:topics].map { |topic| topic[:topic][:name] })
      .to match_array(topics.pluck(:name))
  end

  it 'returns success' do
    expect(subject).to have_http_status(:success)
  end

  it 'assigns the specified filename' do
    topic.avatar.attach(file)
    expect(topic.avatar.attached?).to be
  end
end
