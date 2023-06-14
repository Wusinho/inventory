FactoryBot.define do
  factory :category do
    name { Faker::Appliance.equipment }
  end
end
