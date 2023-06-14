FactoryBot.define do
  price = Faker::Commerce.price
  factory :inventory_purchase do
    selling_price { price + 5 }
    stock_quantity {  [2,4,5].sample }
    purchase_price { price }
    sold_out { false }
    product
  end
end
