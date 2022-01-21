require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品の情報を入力' do
    it 'new_itemsが空では登録できない' do
      @item.new_items = ''
      @item.valid?
      expect(@item.errors.full_messages).to include "New items can't be blank"
    end
    it 'categoryが空では登録できない' do
      @item.category_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include "Category can't be blank"
    end
    it 'sales_statusが空では登録できない' do
      @item.sales_status_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include "Sales status can't be blank"
    end
    it 'postageが空では登録できない' do
      @item.postage_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include "Postage can't be blank"
    end
    it 'Prefectureが空では登録できない' do
      @item.prefecture_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include "Prefecture can't be blank"
    end
    it 'Shipping_dateが空では登録できない' do
      @item.shipping_date_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include "Shipping date can't be blank"
    end
    it 'Sell_priceが空では登録できない' do
      @item.sell_price = ''
      @item.valid?
      expect(@item.errors.full_messages).to include "Sell price can't be blank"
    end
  end
end
