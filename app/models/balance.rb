class Balance < ApplicationRecord
  has_many :selling_orders
  has_many :spends
  before_create :fill_sub_total
  before_create :fill_last_date

  def fill_sub_total
    self.sub_total = self.starting_total
  end

  def fill_last_date
    self.last_day = Date.today.end_of_month
  end

  def created_month
    created_at.strftime("%b %d")
  end

end
