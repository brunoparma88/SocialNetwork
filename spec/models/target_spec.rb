require 'rails_helper'

describe Target do
  describe 'Associations' do
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
  end
end
