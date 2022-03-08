class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:index, :create]
  before_action :prevent_url, only: [:index, :create]

  def index
    @order_address = OrderAddress.new
  end

  def create
    @order_address = OrderAddress.new(order_params)
     if @order_address.valid?
      pay_item
      @order_address.save
      return redirect_to root_path
     else
      render :'index'
     end
  end

  def show
  end

  private

  def order_params
    params.require(:order_address).permit(:post_code, :prefecture_id, :city, :town_number, :building_name, :phone_number, :order ).merge(item_id: params[:item_id], user_id: current_user.id, token: params[:token])
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def prevent_url
    if @item.user_id == current_user.id || @item.order != nil
      redirect_to root_path
    end
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
        amount: @item.sell_price,
        card: order_params[:token],
        currency: 'jpy'
      )
  end

end