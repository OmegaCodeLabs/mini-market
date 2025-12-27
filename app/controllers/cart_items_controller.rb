class CartItemsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_cart

  def create
    @item = Item.find(params[:item_id])
    @cart_item = @cart.cart_items.find_or_initialize_by(item: @item)

    if @cart_item.persisted?
      # Item already in cart, increase quantity
      @cart_item.quantity += params[:quantity].to_i
    else
      # New item, set quantity
      @cart_item.quantity = params[:quantity].to_i || 1
    end

    if @cart_item.save
      redirect_to cart_path, notice: "Item added to cart."
    else
      redirect_to @item, alert: "Could not add item to cart."
    end
  end

  def update
    @cart_item = @cart.cart_items.find(params[:id])

    if @cart_item.update(cart_item_params)
      redirect_to cart_path, notice: "Cart updated."
    else
      redirect_to cart_path, alert: "Could not update cart."
    end
  end

  def destroy
    @cart_item = @cart.cart_items.find(params[:id])
    @cart_item.destroy!
    redirect_to cart_path, notice: "Item removed from cart."
  end

  private

  def set_cart
    @cart = current_user.cart
  end

  def cart_item_params
    params.require(:cart_item).permit(:quantity)
  end
end
