class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :item

  # Validations
  validates :item_name, :price, :quantity, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0 }
  validates :quantity, numericality: { greater_than: 0 }

  # Calculate subtotal for this line item (price * quantity)
  def subtotal
    price * quantity
  end
end
