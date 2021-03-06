# == Schema Information
#
# Table name: topics
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_topics_on_name  (name) UNIQUE
#
require 'rails_helper'

describe Topic do
  describe 'image' do
    let(:topic) { create(:topic, :with_avatar) }
    it 'have avatar attached' do
      expect(topic.avatar.attached?).to be
    end
  end

  describe 'Associations' do
    it { is_expected.to have_many(:targets).dependent(:destroy) }
  end

  describe 'validations' do
    context 'when was created with regular login' do
      subject { build(:topic, :with_avatar) }
      it { is_expected.to validate_presence_of(:name) }
      it { is_expected.to validate_uniqueness_of(:name) }
    end
  end
end
