class Provider < ApplicationRecord
  validates_presence_of :phone, :name
  has_many :products
end
