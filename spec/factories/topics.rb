FactoryBot.define do
  factory :topic do
    name      { Faker::Movie.title }
    image     { Faker::LoremFlickr.image }
  end
end
