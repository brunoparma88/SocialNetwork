FactoryBot.define do
  factory :topic do
    name      { Faker::Movie.title }
  end
end
