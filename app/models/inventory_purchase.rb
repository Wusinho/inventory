class InventoryPurchase < ApplicationRecord
  belongs_to :product
  has_many :selling_orders
  validates_presence_of :stock_quantity, :purchase_price, :selling_price
  accepts_nested_attributes_for :selling_orders, reject_if: :all_blank, allow_destroy: true
  before_create :round_nums

  def stock_left?
    self.stock_quantity.positive?
  end

  def round_nums
    self.purchase_price = self.purchase_price.round(2)
    self.selling_price = self.selling_price.round(2)
  end

end
