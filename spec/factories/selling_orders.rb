FactoryBot.define do
  factory :selling_order do
    price { inventory_purchase.price + 5 }
    quantity { 1 }
    discount { false }
    inventory_purchase
  end
end
