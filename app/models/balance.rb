class Balance < ApplicationRecord
  has_many :selling_orders
  has_many :expenses
  before_save :fill_sub_total

  def fill_sub_total
    self.sub_total = self.starting_total
  end
end
