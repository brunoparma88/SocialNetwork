FactoryBot.define do
  factory :target do
    user
    topic
    title       { Faker::Movie.title }
    latitude    { Faker::Number.decimal(2, 6) }
    longitude   { Faker::Number.decimal(2, 6) }
    radius      { Faker::Number.number(4) }
  end
end
