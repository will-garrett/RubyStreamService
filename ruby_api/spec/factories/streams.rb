FactoryBot.define do
  factory :todo do
    title { Faker::Lorem.word }
    description {Faker::Lorem.sentence}
    userId { Faker::Number.number(10) }
  end
end