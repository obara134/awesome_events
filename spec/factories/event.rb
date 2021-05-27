FactoryBot.define do
  factory :event do
    name { Faker::Lorem.characters(number:10) }
    introduction { Faker::Lorem.characters(number:30) }
    place { Faker::Lorem.characters(number:10) }
    start_at { '2021-05-02 15:00:00' }
    end_at { '2021-05-02 15:00:00' }
    user
  end
end