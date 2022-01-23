class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
     if @item.save
      redirect_to root_path
     else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:new_items, :items_explain, :category_id, :sales_status_id, :postage_id, :prefecture_id, :shipping_date_id, :sell_price, :image).merge(user_id: current_user.id)
  end
end
