class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:edit, :update, :show, :destroy]
  before_action :prevent_url, only: [:edit, :update, :destroy]

  def index
    @items = Item.all.order(created_at: :desc)
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

  def show
  end

  def edit
    redirect_to root_path unless current_user.id == @item.user_id
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit
    end
  end

  def destroy
   if current_user.id == @item.user_id
    @item.destroy
   end
    redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(:new_items, :items_explain, :category_id, :sales_status_id, :postage_id, :prefecture_id, :shipping_date_id, :sell_price, :image).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def prevent_url
    if @item.user_id != current_user.id || @item.order != nil
      redirect_to root_path
    end
  end
end