class SellingOrder < ApplicationRecord
  belongs_to :inventory_purchase
  belongs_to :customer
  belongs_to :balance
  has_one :product, through: :inventory_purchase
  validates :price, presence: true, numericality: { greater_than: 0 }
  validates :quantity, presence: true, numericality: { greater_than: 0 }
  after_create :reduce_existences
  before_update :check_last_balance
  after_update_commit :update_balance
  before_create :round_nums

  def debt_payed
    (quantity * price).round(2)
  end

  def update_date
    updated_at.strftime("%b %d")
  end

  def check_last_balance
    if Balance.last_created_month_day > balance.created_month
      self.balance = Balance.last_created
    end
  end

  def update_balance

    new_balance = balance.sub_total + (quantity * price).round(2)
    balance.update_attribute(:sub_total, new_balance )
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
