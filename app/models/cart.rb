class Cart < ApplicationRecord
  belongs_to :user
  has_many :cart_items, dependent: :destroy
  has_many :items, through: :cart_items

  # One cart per user
  validates :user_id, uniqueness: true

  # Use UUID in URLs instead of ID
  def to_param
    uuid
  end

  # Calculate total price of all items in cart
  def total
    cart_items.includes(:item).sum { |ci| ci.item.price * ci.quantity }
  end

  # Total number of items in cart
  def item_count
    cart_items.sum(:quantity)
  end

  # Check if cart is empty
  def empty?
    cart_items.none?
  end
end
