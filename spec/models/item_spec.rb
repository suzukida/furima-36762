require 'rails_helper'
  RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
  describe '商品出品' do

    context '正常系' do
      it 'すべての項目が入力されていれば登録できる' do
        expect(@item).to be_valid
      end
      context '異常系' do
        it '画像がなければ登録できない' do
          @item.image = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Image can't be blank")
        end
        it '商品名がなければ登録できない' do
          @item.item_name = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Item name can't be blank")
        end
        it '商品の説明がなければ登録できない' do
          @item.explanation = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Explanation can't be blank")
        end
        it 'カテゴリーがなければ登録できない' do
          @item.category_id = 0
          @item.valid?
          expect(@item.errors.full_messages).to include("Category を選択してください")
        end
        it '商品の状態がなければ登録できない' do
          @item.condition_id = 0
          @item.valid?
          expect(@item.errors.full_messages).to include("Condition を選択してください")
        end
        it '配送料の負担がなければ登録できない' do
          @item.shipping_id = 0
          @item.valid?
          expect(@item.errors.full_messages).to include("Shipping を選択してください")
        end
        it '発送元の地域がなければ登録できない' do
          @item.prefecture_id = 0
          @item.valid?
          expect(@item.errors.full_messages).to include("Prefecture を選択してください")
        end
        it '発送までの日数がなければ登録できない' do
          @item.delivery_id = 0
          @item.valid?
          expect(@item.errors.full_messages).to include("Delivery を選択してください")
        end
        it '価格が空だと登録できない' do
          @item.item_price = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Item price ¥300~¥9,999,999の間で入力してください")
        end
        it '価格が300円未満だと登録できない' do
          @item.item_price = 299
          @item.valid?
          expect(@item.errors.full_messages).to include("Item price ¥300~¥9,999,999の間で入力してください")
        end
        it '価格が10,000,000円以上だと登録できない' do 
          @item.item_price = 10000000
          @item.valid?
          expect(@item.errors.full_messages).to include("Item price ¥300~¥9,999,999の間で入力してください")
        end
        it '価格が文字だと登録できない' do 
          @item.item_price = 'unko'
          @item.valid?
          expect(@item.errors.full_messages).to include("Item price ¥300~¥9,999,999の間で入力してください")
        end
        it 'userが紐付いていなければ出品できない' do 
          @item.user = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("User must exist")
        end

      end
     
     

    end
  end
end