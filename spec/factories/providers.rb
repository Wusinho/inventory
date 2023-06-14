FactoryBot.define do
  factory :provider do
    name { Faker::Company.name }
    address { Faker::Address.full_address }
    contact { Faker::Name.name }
    phone { Faker::PhoneNumber.cell_phone }
    bank_number { "MyString" }
  end
end
