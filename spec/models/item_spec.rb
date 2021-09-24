require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品の登録' do
    context '商品の登録ができる場合' do
      it '全ての項目が入力されている' do
        expect(@item).to be_valid
      end
    end
  
    context '商品の登録が出来ない場合' do
      it '画像が空では登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Image can't be blank"
      end
      it '商品名が空では登録できない' do
        @item.sellername = ""
        @item.valid?
        expect(@item.errors.full_messages).to include "Sellername can't be blank"
      end
      it '商品の説明が空では登録できない' do
        @item.description = ""
        @item.valid?
        expect(@item.errors.full_messages).to include "Description can't be blank"
      end
      it 'カテゴリーが --− では登録できない' do
        @item.category_id = "0"
        @item.valid?
        expect(@item.errors.full_messages).to include "Category can't be blank"
      end
      it '商品の状態が --− では登録できない' do
        @item.condition_id = "0"
        @item.valid?
        expect(@item.errors.full_messages).to include "Condition can't be blank"
      end
      it '配送料の負担が --− では登録できない' do
        @item.fee_id = "0"
        @item.valid?
        expect(@item.errors.full_messages).to include "Fee can't be blank"
      end
      it '発送元の地域が --− では登録できない' do
        @item.prefecture_id = "0"
        @item.valid?
        expect(@item.errors.full_messages).to include "Prefecture can't be blank"
      end
      it '発送までの日数が --− では登録できない' do
        @item.shippingdate_id = "0"
        @item.valid?
        expect(@item.errors.full_messages).to include "Shippingdate can't be blank"
      end
      it '販売価格が空では登録出来ない' do
        @item.price = ""
        @item.valid?
        expect(@item.errors.full_messages).to include "Price can't be blank"
      end
      it '販売価格が300円未満では登録出来ない' do
        @item.price = 200
        @item.valid?
        expect(@item.errors.full_messages).to include "Price is out of setting range"
      end
      it '販売価格が10,000,000円以上では登録出来ない' do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include "Price is out of setting range"
      end
      it '販売価格は全角では登録出来ない' do
        @item.price = "５００"
        @item.valid?
        expect(@item.errors.full_messages).to include "Price is invalid. Input half-width characters"
      end
      it '商品名が40文字以下でなければ登録できない' do
        @item.sellername = "a" * 41
        @item.valid?
        expect(@item.errors.full_messages).to include "Sellername is too long (maximum is 40 characters)"
      end
      it '商品の説明が1000文字以下でなければ登録できない' do
        @item.description = "a" * 1001
        @item.valid?
        expect(@item.errors.full_messages).to include "Description is too long (maximum is 1000 characters)"
      end
      it 'userが紐付いていなければ登録できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
    end
  end
end
