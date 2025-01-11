FactoryBot.define do
  factory :meal do
    name { Faker::Food.dish }
    price { Faker::Commerce.price(range: 10.0..100.0) }
    rating { rand(4.0..5.0).round(1) }
    image_url { Faker::Internet.url }
    association :category
  end
end
