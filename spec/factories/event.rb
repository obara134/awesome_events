FactoryBot.define do
  factory :event do
    name { Faker::Lorem.characters(number:10) }
    introduction { Faker::Lorem.characters(number:30) }
    place { Faker::Lorem.characters(number:10) }
    start_at { Faker::Lorem.characters(number:11) }
    end_at { Faker::Lorem.characters(number: 11) }
    user
  end
end