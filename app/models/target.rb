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
class Target < ApplicationRecord
  belongs_to :user
  belongs_to :topic

  validates :longitude, :latitude, :radius, :title, :user, :topic, presence: true
  validate :mount_of_targets, on: :create

  private

  def mount_of_targets
    errors.add('You reached the limit of targets') if user.targets.count > 10
  end
end
