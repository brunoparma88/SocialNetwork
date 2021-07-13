require 'rails_helper'

describe Topic do
  describe 'image' do
    let(:topic) { create(:topic, :with_avatar) }
    it 'have avatar attached' do
      expect(topic.avatar.attached?).to be
    end
  end
end
