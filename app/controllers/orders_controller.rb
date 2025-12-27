class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_order, only: [:show, :cancel]

  def index
    @orders = policy_scope(Order).includes(:order_items).order(created_at: :desc)
  end

  def show
    authorize @order
  end

  def new
    authorize Order
    @cart = current_user.cart

    if @cart.empty?
      redirect_to cart_path, alert: "Your cart is empty."
      return
    end

    @order = Order.new
  end

  def create
    authorize Order
    @cart = current_user.cart

    if @cart.empty?
      redirect_to cart_path, alert: "Your cart is empty."
      return
    end

    @order = Order.create_from_cart(@cart, shipping_info_params)

    if @order.persisted?
      redirect_to @order, notice: "Order placed successfully!"
    else
      render :new, status: :unprocessable_entity
    end
  rescue ActiveRecord::RecordInvalid => e
    redirect_to cart_path, alert: "Could not create order: #{e.message}"
  end

  def cancel
    authorize @order, :cancel?

    if @order.cancel!
      redirect_to @order, notice: "Order cancelled successfully."
    else
      redirect_to @order, alert: "Could not cancel order."
    end
  end

  private

  def set_order
    @order = Order.find_by!(uuid: params[:id])
  end

  def shipping_info_params
    params.require(:order).permit(:shipping_name, :shipping_address, :shipping_city, :shipping_state, :shipping_zip, :shipping_country)
  end
end
