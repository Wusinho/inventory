class Category < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  before_save :name_to_downcase

  def name_to_downcase
    self.name = self.name.downcase
  end
end
