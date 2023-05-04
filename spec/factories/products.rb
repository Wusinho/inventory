FactoryBot.define do
  factory :product do
    name { Faker::Commerce.product_name }
    description { Faker::Lorem.paragraph }
    provider
  end
end
