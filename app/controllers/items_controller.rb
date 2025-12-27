class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  def index
    @items = policy_scope(Item).includes(:categories)
  end

  def show
    authorize @item
  end

  def new
    @item = Item.new
    authorize @item
  end

  def create
    @item = Item.new(item_params)
    authorize @item

    if @item.save
      redirect_to @item, notice: "Item was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    authorize @item
  end

  def update
    authorize @item

    if @item.update(item_params)
      redirect_to @item, notice: "Item was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    authorize @item
    @item.destroy!
    redirect_to items_path, notice: "Item was successfully deleted."
  end

  private

  def set_item
    @item = Item.find_by!(uuid: params[:id])
  end

  def item_params
    params.require(:item).permit(:name, :description, :sku, :price, :stock_quantity, :active, category_ids: [])
  end
end
