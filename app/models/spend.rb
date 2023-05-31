class Spend < ApplicationRecord
  belongs_to :balance

  after_create_commit :update_balance

  def update_balance
    new_balance = balance.sub_total - payments
    balance.update_attribute(:sub_total, new_balance )
  end

end
