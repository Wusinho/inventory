class InventoryPurchase < ApplicationRecord
  belongs_to :product
  has_many :selling_orders
  validates_presence_of :stock_quantity, :purchase_price, :selling_price
  accepts_nested_attributes_for :selling_orders, reject_if: :all_blank, allow_destroy: true

  def stock_left?
    self.stock_quantity.positive?
  end

end
