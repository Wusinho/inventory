class SellingOrder < ApplicationRecord
  belongs_to :inventory_purchase
  belongs_to :customer
  has_one :product, through: :inventory_purchase
  validates :price, presence: true, numericality: { greater_than: 0 }
  validates :quantity, presence: true, numericality: { greater_than: 0 }
  after_create :reduce_existences
  before_create :round_nums

  def reduce_existences
    inventory_purchase.decrement!(:stock_quantity, self.quantity)
    inventory_purchase.update(sold_out: true) if zero_stock?
  end

  def zero_stock?
    inventory_purchase.stock_quantity.zero?
  end
  def round_nums
    self.price = self.price.round(2)
  end
end
