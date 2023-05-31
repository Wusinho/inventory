class Spend < ApplicationRecord
  belongs_to :balance

  after_create_commit :update_balance

  def update_balance
    debugger
    last_balance.update_attribute(:sub_total, last_balance.sub_total - payments)
    last_balance.reload
  end


  def last_balance
    Balance.last
  end

end
