class Category < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  before_save :name_to_downcase
  has_many :product_categories
  has_many :products, through: :product_categories
  scope :ordered_by_name, -> { order(name: :asc) }
  def name_to_downcase
    self.name = self.name.downcase
  end
end
