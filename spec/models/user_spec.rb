# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  allow_password_change  :boolean          default(FALSE)
#  confirmation_sent_at   :datetime
#  confirmation_token     :string
#  confirmed_at           :datetime
#  email                  :string
#  encrypted_password     :string           default(""), not null
#  gender                 :integer
#  image                  :string
#  name                   :string
#  nickname               :string
#  provider               :string           default("email"), not null
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  tokens                 :json
#  uid                    :string           default(""), not null
#  unconfirmed_email      :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_confirmation_token    (confirmation_token) UNIQUE
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#  index_users_on_uid_and_provider      (uid,provider) UNIQUE
#

require 'rails_helper'

describe User do
  describe 'gender' do
    subject { build :user }

    let(:user) { create(:user, :male) }

    it 'returns the correct gender' do
      expect(user.gender).to eq('female').or eq('male')
      # expect(user :gender).to equal(0).or equal(1)
      # expect(invoice with category fee).to be_valid
    end
  end

  describe 'validations' do
    context 'when was created with regular login' do
      subject { build :user }
      it { is_expected.to validate_presence_of(:email) }
    end
  end
end
