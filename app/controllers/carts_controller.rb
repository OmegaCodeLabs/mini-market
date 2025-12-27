class CartsController < ApplicationController
  before_action :authenticate_user!

  def show
    @cart = current_user.cart
    authorize @cart
    @cart_items = @cart.cart_items.includes(:item)
  end
end
