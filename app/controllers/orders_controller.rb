class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:index, :create]

  def index
    @order_address = OrderAddress.new
  end

  def create
    @order_address = OrderAddress.new(order_params)
     if @order_address.save
      redirect_to root_path
     else
      render :new
    end
  end

  private

  def order_params
    params.require(:order_address).permit(:item, :user).merge(user_id: current_user.id)
  end

  def address_params
    params.require(:order_address).permit(:post_code, :prefecture_id, :city, :town_number, :building_name, :phone_number, :order).merge(order_id: @order.id)
  end

  def set_item
    @item = Item.find(params[:item_id])
  end
end
