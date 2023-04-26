class Product < ApplicationRecord
  belongs_to :provider
  has_many :inventory_purchases
  acts_as_taggable_on :tags
  accepts_nested_attributes_for :inventory_purchases, allow_destroy: true
  validates_presence_of :name
  after_create_commit { broadcast_prepend_to "products" }

end
