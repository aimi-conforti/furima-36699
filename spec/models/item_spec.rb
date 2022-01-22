require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品の情報を入力' do
    context '出品できるとき' do
      it 'すべての項目が入力されていれば出品できる' do
      end
    end

    context '出品できないとき' do
      it 'imageが空では出品できない' do
        @item.image = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Image can't be blank"
      end
      it 'new_itemsが空では出品できない' do
        @item.new_items = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "New items can't be blank"
      end
      it 'items_explainが空では出品できない' do
        @item.items_explain = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Items explain can't be blank"
      end
      it 'categoryに「---」が選択されている場合は出品できない' do
        @item.category_id = '---'
        @item.valid?
        expect(@item.errors.full_messages).to include "Category can't be blank"
      end      
      it 'sales_statusに「---」が選択されている場合は出品できない' do
        @item.sales_status_id = '---'
        @item.valid?
        expect(@item.errors.full_messages).to include "Sales status can't be blank"
      end
      it 'postageに「---」が選択されている場合は出品できない' do
        @item.postage_id = '---'
        @item.valid?
        expect(@item.errors.full_messages).to include "Postage can't be blank"
      end
      it 'Prefectureに「---」が選択されている場合はできない' do
        @item.prefecture_id = '---'
        @item.valid?
        expect(@item.errors.full_messages).to include "Prefecture can't be blank"
      end
      it 'Shipping_dateに「---」が選択されている場合は出品できない' do
        @item.shipping_date_id = '---'
        @item.valid?
        expect(@item.errors.full_messages).to include "Shipping date can't be blank"
      end
      it 'Sell_priceが空では出品できない' do
        @item.sell_price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Sell price can't be blank"
      end
      it 'Sell_priceに半角数字以外が含まれている場合は出品できない' do
        @item.sell_price = '３００'
        @item.valid?
        expect(@item.errors.full_messages).to include "Sell price please enter in half width numbers"
      end
      it 'Sell_priceが300円未満では出品できない' do
        @item.sell_price = '100'
        @item.valid?
        expect(@item.errors.full_messages).to include "Sell price needs to be more than 300yen"
      end
      it 'Sell_priceが9_999_999円を超えると出品できない' do
        @item.sell_price = '10_000_000'
        @item.valid?
        expect(@item.errors.full_messages).to include "Sell price can't be more than 9_999_999yen"
      end
        it 'Userが紐付いていなければ出品できない' do
        @item.user = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "User needs to log in"
      end
    end
  end
end