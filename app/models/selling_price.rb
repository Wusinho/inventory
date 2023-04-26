class SellingPrice < ApplicationRecord
  belongs_to :inventory_purchase
  validate :stock_quantity
  after_create :reduce_existences

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

end
