class Expense < ApplicationRecord
  belongs_to :balance
  validates_presence_of :details, :payments
  before_save :round_payments
  after_create_commit :update_balance

  def round_payments
    self.payments = self.payments.round(2)
  end

  def update_balance
    new_balance = balance.sub_total - payments
    balance.update_attribute(:sub_total, new_balance )
  end

  def created_date
    created_at.strftime("%b %d")
  end

end
