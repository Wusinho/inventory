class Product < ApplicationRecord
  belongs_to :provider
  has_many :inventory_purchases, -> { order(sold_out: :asc, created_at: :asc) }, dependent: :delete_all
  has_many :product_categories
  has_many :categories, through: :product_categories
  accepts_nested_attributes_for :inventory_purchases, allow_destroy: true
  accepts_nested_attributes_for :product_categories, allow_destroy: true

  def tag_list_empty
    return unless tag_list.blank?

    errors.add(:tag_list, 'Categories cannot be empty')
  end

  def all_categories
    Category.all
  end

end
