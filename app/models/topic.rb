# == Schema Information
#
# Table name: topics
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Topic < ApplicationRecord
  validates :name, presence: true
  has_one_base64_attached :avatar
  scope :get_all, -> { limit(10) }
end
