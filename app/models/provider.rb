class Provider < ApplicationRecord
  validates_presence_of :phone, :name
end
