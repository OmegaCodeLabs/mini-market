class Order < ApplicationRecord
  belongs_to :user
  has_many :order_items, dependent: :destroy
  has_many :items, through: :order_items

  # Validations
  validates :total, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :status, inclusion: { in: %w[pending completed cancelled shipped] }

  # Use UUID in URLs instead of ID
  def to_param
    uuid
  end

  # Create order from cart
  def self.create_from_cart(cart, shipping_info = {})
    order = nil

    ActiveRecord::Base.transaction do
      # Create order
      order = create!(
        user: cart.user,
        total: cart.total,
        status: 'pending',
        shipping_name: shipping_info[:name],
        shipping_address: shipping_info[:address],
        shipping_city: shipping_info[:city],
        shipping_state: shipping_info[:state],
        shipping_zip: shipping_info[:zip],
        shipping_country: shipping_info[:country]
      )

      # Copy cart items to order items (snapshot prices)
      cart.cart_items.includes(:item).each do |cart_item|
        order.order_items.create!(
          item: cart_item.item,
          item_name: cart_item.item.name,
          item_sku: cart_item.item.sku,
          price: cart_item.item.price,
          quantity: cart_item.quantity
        )

        # Decrease stock
        cart_item.item.decrement!(:stock_quantity, cart_item.quantity)
      end

      # Clear cart
      cart.cart_items.destroy_all
    end

    order
  end

  # Check if order can be cancelled
  def cancellable?
    status == 'pending'
  end

  # Cancel order (restore stock)
  def cancel!
    return false unless cancellable?

    ActiveRecord::Base.transaction do
      # Restore stock
      order_items.each do |order_item|
        order_item.item.increment!(:stock_quantity, order_item.quantity)
      end

      # Update status
      update!(status: 'cancelled')
    end

    true
  end
end
