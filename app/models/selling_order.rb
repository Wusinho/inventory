class SellingOrder < ApplicationRecord
  belongs_to :inventory_purchase
  validates :price, presence: true, numericality: { greater_than: 0 }
  validates :quantity, presence: true, numericality: { greater_than: 0 }
  validate :stock_quantity
  after_create :reduce_existences
  before_create :round_nums

  def stock_quantity
    return unless self.quantity > self.inventory_purchase.stock_quantity

    errors.add(:quantity, 'You cannot sell more than what you have')
  end

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
