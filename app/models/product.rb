class Product < ApplicationRecord
  belongs_to :provider
  has_many :prices
  accepts_nested_attributes_for :prices, allow_destroy: true
  validates_presence_of :name

end
