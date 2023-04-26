class InventoryPurchase < ApplicationRecord
  belongs_to :product
  has_many :selling_prices
  accepts_nested_attributes_for :selling_prices, reject_if: :all_blank, allow_destroy: true

  def stock?
    self.stock_quantity.positive?
  end

end
