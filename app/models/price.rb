class Price < ApplicationRecord
  belongs_to :product
  has_many :selling_prices
end
