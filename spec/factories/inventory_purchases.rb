FactoryBot.define do
  factory :inventory_purchase do
    stock { "MyString" }
    purchase_price { "MyString" }
    sold_out { "MyString" }
    product { nil }
  end
end
