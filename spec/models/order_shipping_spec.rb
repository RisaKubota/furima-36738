require 'rails_helper'

RSpec.describe OrderShipping, type: :model do
  describe '発送先情報入力' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @order_shipping = FactoryBot.build(:order_shipping, user_id: user.id, item_id: item.id)
      sleep 0.1  # テストコードに不具合が生じるため追加で記述しています
    end

    context '内容に問題がない場合' do
      it 'すべての値が正しく入力されていれば保存できる' do
        expect(@order_shipping).to be_valid
      end
      it 'buildingは空でも保存できる' do
        @order_shipping.building = ''
        expect(@order_shipping).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it '郵便番号が空だと保存できない' do
        @order_shipping.postalcode = ''
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include "Postalcode can't be blank"
      end
      it '郵便番号が半角数字且つハイフンを含まないと保存できない' do
        @order_shipping.postalcode = '1111111'
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include "Postalcode is invalid. Include hyphen(-)"
      end
      it '市区町村が空だと保存できな' do
        @order_shipping.municipalities = ''
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include "Municipalities can't be blank"

      end
      it '番地が空だと保存できない' do
        @order_shipping.housenum = ''
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include "Housenum can't be blank"
      end
      it '電話番号が空だと保存できない' do
        @order_shipping.tel = ''
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include "Tel is invalid"
      end
      it '電話番号が半角数字でなければ保存できない' do
        @order_shipping.tel = '０１２３４５６７８９'
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include "Tel is invalid"
      end
      it '電話番号が10桁又は11桁でなければ保存できない' do
        @order_shipping.tel = '0120'
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include "Tel is invalid"
      end
      it '都道府県が−−−では保存できない' do
        @order_shipping.prefecture_id = "0"
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include "Prefecture can't be blank"
      end
      it 'トークンが空では保存できない' do
        @order_shipping.token = ''
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include "Token can't be blank"
      end
    end
  end
end