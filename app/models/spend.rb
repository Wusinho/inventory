class Spend < ApplicationRecord
  belongs_to :balance
  validates_presence_of :details, :payments
  after_create_commit :update_balance

  def update_balance
    new_balance = balance.sub_total - payments
    balance.update_attribute(:sub_total, new_balance )
  end

  def created_date
    created_at.strftime("%b %d")
  end

end
