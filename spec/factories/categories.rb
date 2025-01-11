FactoryBot.define do
  factory :category do
    name { "Category #{Faker::Number.number(digits: 3)}" }
    description { Faker::Lorem.sentence }
    image_url { Faker::Internet.url }
  end
end
