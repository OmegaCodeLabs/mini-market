class CartItem < ApplicationRecord
  belongs_to :cart
  belongs_to :item

  # Validations
  validates :quantity, numericality: { greater_than: 0 }
  validates :item_id, uniqueness: { scope: :cart_id, message: "is already in the cart" }

  # Calculate subtotal for this line item (price * quantity)
  def subtotal
    item.price * quantity
  end
end
