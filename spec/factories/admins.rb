FactoryBot.define do
  factory :admin do
    email { "#{Faker::Alphanumeric.alpha(number: [8, 10].sample)}@gmail.com" }
    name { Faker::Name.first_name }
    last_name { Faker::Name.last_name  }
    password { '123456' }
    password_confirmation { '123456' }
  end
end
