# == Schema Information
#
# Table name: targets
#
#  id         :bigint           not null, primary key
#  title      :string           not null
#  latitude   :float            not null
#  longitude  :float            not null
#  radius     :float            not null
#  topic_id   :bigint           not null
#  user_id    :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_targets_on_topic_id  (topic_id)
#  index_targets_on_user_id   (user_id)
#
require 'rails_helper'

describe Target do
  describe 'Associations' do
    subject { create :target, user: create(:user), topic: create(:topic) }
    it { is_expected.to belong_to(:user) }
    it { is_expected.to belong_to(:topic) }
  end

  describe 'Validations' do
    subject { build :target, user: create(:user) }
    it { is_expected.to validate_presence_of(:topic) }
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:latitude) }
    it { is_expected.to validate_presence_of(:longitude) }
    it { is_expected.to validate_presence_of(:radius) }

    describe '#amount_of_targets' do
      let!(:user)  { create(:user) }
      let(:target) { build(:target, user: user) }

      context 'when user does NOT reach the limit amount of targets' do
        it 'creates a new target' do
          expect(target).to be_valid
        end
      end

      context 'when user reaches the limit amount of targets' do
        it 'does NOT create a new target' do
          create_list(:target, 11, user: user)
          expect(target).not_to be_valid
        end
      end
    end
  end
end
