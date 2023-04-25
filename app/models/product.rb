class Product < ApplicationRecord
  belongs_to :provider
  has_many :costs
  accepts_nested_attributes_for :costs, allow_destroy: true
  validates_presence_of :name
  after_create_commit { broadcast_prepend_to "products" }

end
