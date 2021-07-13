# == Schema Information
#
# Table name: topics
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :topic do
    name { Faker::Movie.title }
  end

  trait :with_avatar do
    after :create do |topic|
      file = {
        io: File.open(
          File.expand_path(File.join(File.dirname(__FILE__) + '/..', 'fixtures',
                                     'generic-logo.png'))
        ),
        filename: 'generic-logo.png'
      }
      topic.avatar.attach(file)
    end
  end
end
