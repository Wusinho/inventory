class Product < ApplicationRecord
  include Filterable
  belongs_to :provider
  has_many :inventory_purchases, -> { order(sold_out: :asc, created_at: :asc) }, dependent: :delete_all
  has_many :product_categories
  has_many :categories, through: :product_categories
  accepts_nested_attributes_for :inventory_purchases, allow_destroy: true
  accepts_nested_attributes_for :product_categories, allow_destroy: true
  validates_presence_of :name
  scope :filter_sort_by_name, ->(value) { order("#{value} ASC") }
  scope :filter_search, ->(value) { where( "name ILIKE :search OR description ILIKE :search", search: "%#{value.downcase}%") }
  scope :filter_categories, ->(value) { joins(:categories).where(categories: { id: value }).distinct }

  def tag_list_empty
    return unless tag_list.blank?

    errors.add(:tag_list, 'Categories cannot be empty')
  end

  def all_categories
    Category.all
  end

  def out_of_stock?
    inventory_purchases.where(sold_out: false).blank?
  end

end
