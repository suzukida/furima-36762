require 'rails_helper'

RSpec.describe User, type: :model do
  describe '商品購入' do
    before do
      @user = FactoryBot.create(:user)
      @item = FactoryBot.create(:item)
      @order = FactoryBot.build(:order, user_id: @user.id,item_id: @item.id)
      sleep 0.1
    end

    context '正常系' do
      it '全ての項目が入力されていれば購入できる' do
      expect(@order).to be_valid
      end
      it '建物名は空でも保存できること' do
        @order.building_name = ''
        expect(@order).to be_valid
      end
    end

    context '異常系' do
      it 'tokenが空だと保存できない' do
        @order.token = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Token can't be blank")
      end
      it '郵便番号が空だと保存できない' do
        @order.post_code = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Post code can't be blank")
      end
      it '郵便番号が半角のハイフンを含んだ形式でないと保存できない' do
        @order.post_code = '1234567'
        @order.valid?
        expect(@order.errors.full_messages).to include("Post code is invalid")
      end
      it '郵便番号が８桁だと保存できない' do
        @order.post_code = '123-12345'
        @order.valid?
        expect(@order.errors.full_messages).to include("Post code is invalid")
      end
      it '郵便番号の文字数が足りないと保存できない' do
        @order.post_code = '123-123'
        @order.valid?
        expect(@order.errors.full_messages).to include("Post code is invalid")
      end
      it '都道府県、選択がない場合は登録できない' do
        @order.prefecture_id = 0
        @order.valid?
        expect(@order.errors.full_messages).to include("Prefecture を選択してください")
      end
      it '都道府県、空の場合は登録できない' do
        @order.prefecture_id = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Prefecture を選択してください")
      end
        it '市町が空だと保存できない' do
        @order.city = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("City can't be blank")
      end
      it '番地が空だと保存できない' do
        @order.city_address = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("City address can't be blank")
      end
      it '電話番号が空だと保存できない' do
        @order.phone_number = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number can't be blank")
      end
      it '電話番号が12桁以上だと保存できない' do
        @order.phone_number = 123456789101112
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number is too long (maximum is 11 characters)")
      end
      it '電話番号が足りない場合だと保存できない' do
        @order.phone_number = 12345
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number is invalid")
      end
      it '電話番号が異常な番号の場合だと保存できない' do
        @order.phone_number = 123-123-123
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number is invalid")
      end
      it 'userが紐付いていないと保存できないこと' do
        @order.user_id = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐付いていないと保存できないこと' do
        @order.item_id = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Item can't be blank")
      end

    end
  end
end