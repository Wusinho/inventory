class Provider < ApplicationRecord
  has_many :products

  validates_presence_of :phone, :name
end
