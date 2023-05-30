class Balance < ApplicationRecord
  before_save :fill_sub_total

  def fill_sub_total
    self.sub_total = self.starting_total
  end
end
