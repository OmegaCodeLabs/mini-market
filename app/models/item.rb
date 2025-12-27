class Item < ApplicationRecord
  # Relationships
  has_many :item_categories, dependent: :destroy
  has_many :categories, through: :item_categories
  has_many :cart_items, dependent: :restrict_with_error  # Don't delete if in carts
  has_many :order_items, dependent: :restrict_with_error  # Don't delete if in orders

  # Validations
  validates :name, :price, presence: true
  validates :sku, uniqueness: true, allow_blank: true
  validates :price, numericality: { greater_than_or_equal_to: 0 }
  validates :stock_quantity, numericality: { greater_than_or_equal_to: 0 }

  # Use UUID in URLs instead of ID
  def to_param
    uuid
  end

  # Check if item is in stock
  def in_stock?(quantity = 1)
    stock_quantity >= quantity
  end
end
