class Product < ApplicationRecord
  validates_presence_of :name
  belongs_to :provider
end
