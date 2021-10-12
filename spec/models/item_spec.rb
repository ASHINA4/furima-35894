require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品' do
    context '商品が出品できるとき' do
      it 'image, name, info, category_id, sales_status_id, shipping_fee_status_id, prefecture_id, scheduled_delivery_id, priceが正しく存在すれば出品できる' do
        expect(@item).to be_valid
      end
    end

    context '商品が出品できないとき' do
      it '商品画像が空では出品できない' do
        @item.image = nil 
        @item.valid?
        expect(@item.errors.full_messages).to include "Image can't be blank"
      end

      it '商品名が空では出品できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Name can't be blank"
      end
      it '商品名が４０字以上では出品できない' do
        @item.name = 'a' * 41
        @item.valid?
        expect(@item.errors.full_messages).to include "Name is too long (maximum is 40 characters)"
      end
      it '商品の説明が空では出品できない' do
        @item.info = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Info can't be blank"
      end
      it '商品の説明が１,０００文字以上では出品できない' do
        @item.info = 'a' * 1001
        @item.valid?
        expect(@item.errors.full_messages).to include "Info is too long (maximum is 1000 characters)"
      end
      it 'カテゴリーが---では出品できない' do
        @item.category_id = '0'
        @item.valid?
        expect(@item.errors.full_messages).to include "Category can't be blank"
      end
      it '商品の状態が---では出品できない' do
        @item.sales_status_id = '0'
        @item.valid?
        expect(@item.errors.full_messages).to include "Sales status can't be blank"
      end
      it '配送料の負担が---では出品できない' do
        @item.shipping_fee_status_id = '0'
        @item.valid?
        expect(@item.errors.full_messages).to include "Shipping fee status can't be blank"
      end
      it '発送元の地域が---では出品できない' do
        @item.prefecture_id = '0'
        @item.valid?
        expect(@item.errors.full_messages).to include "Prefecture can't be blank"
      end
      it '発送までの日程が---では出品できない' do
        @item.scheduled_delivery_id = '0'
        @item.valid?
        expect(@item.errors.full_messages).to include "Scheduled delivery can't be blank"
      end
      it '販売価格が空では出品できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Price is not a number"
      end
      it '販売価格が¥300以下では出品できない' do
        @item.price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include "Price must be greater than or equal to 300"
      end
      it '販売価格が¥9,999,999以上では出品できない' do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include  "Price must be less than or equal to 9999999"
      end
    end
  end
  # pending "add some examples to (or delete) #{__FILE__}"
end

