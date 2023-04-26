class SellingPrice < ApplicationRecord
  belongs_to :cost
  after_create :reduce_existences
end
