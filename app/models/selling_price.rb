class SellingPrice < ApplicationRecord
  belongs_to :inventory_purchase
  after_create :reduce_existences
end
