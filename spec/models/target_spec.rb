
require 'rails_helper'

describe Target do
  describe 'Associations' do
    it { should belong_to(:user) }
    it { should belong_to(:topic) }
  end

  describe 'Validations' do
    subject { build :target, user: create(:user) }

    it { should validate_presence_of(:topic) }
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:latitude) }
    it { should validate_presence_of(:longitude) }
    it { should validate_presence_of(:radius) }
  end
end
