class InventoryPurchase < ApplicationRecord
  belongs_to :product
  has_many :selling_orders
  accepts_nested_attributes_for :selling_orders, reject_if: :all_blank, allow_destroy: true

  def stock_left?
    self.stock_quantity.positive?
  end

end
