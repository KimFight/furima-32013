  require 'rails_helper'
  # bundle exec rspec spec/models/order_purchase_spec.rb
  RSpec.describe OrderPurchase, type: :model do
    
   describe '購入者情報の保存' do
      
      before do
        @order_purchase = FactoryBot.build(:order_purchase)
      end

    context '購入できる時' do

        it 'すべての値(token追加)が正しく入力されていれば保存できること' do
          expect(@order_purchase).to be_valid
        end

        it 'building_nameが空でも保存できること' do
          @order_purchase.building_name = nil
          expect(@order_purchase).to be_valid
         end
    end

    context '購入できない時' do

        it 'postal_codeが空だと保存できないこと' do
          @order_purchase.postal_code = nil
          @order_purchase.valid?
          expect(@order_purchase.errors.full_messages).to include("Postal code can't be blank", "Postal code is invalid. Include hyphen(-)")
      end

      it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
          @order_purchase.postal_code = '1234567'
          @order_purchase.valid?
          expect(@order_purchase.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end

      it 'prefectures_idが空だと保存できないこと' do
        @order_purchase.prefectures_id = nil
        @order_purchase.valid?
        expect(@order_purchase.errors.full_messages).to include("Prefectures can't be blank", "Prefectures is not a number")
      end

      it "prefectures_idが1では登録できないこと" do
        @order_purchase.prefectures_id = 1
        @order_purchase.valid?
        expect(@order_purchase.errors.full_messages).to include("Prefectures must be other than 1")
      end

      it 'municipalityが空だと保存できないこと' do
        @order_purchase.municipality = nil
        @order_purchase.valid?
        expect(@order_purchase.errors.full_messages).to include("Municipality can't be blank")
      end

      it 'addressが空だと保存できないこと' do
        @order_purchase.address = nil
        @order_purchase.valid?
        expect(@order_purchase.errors.full_messages).to include("Address can't be blank")
      end

      it 'phone_numberが空だと保存できないこと' do
        @order_purchase.phone_number = nil
        @order_purchase.valid?
        expect(@order_purchase.errors.full_messages).to include("Phone number can't be blank", "Phone number is invalid.")
      end
    
      it 'phone_numberは半角ハイフンがあると保存できないこと' do
        @order_purchase.phone_number = '090-1234-5678'
        @order_purchase.valid?
        expect(@order_purchase.errors.full_messages).to include("Phone number is invalid.")
      end

      it 'phone_numberが全角数字だと保存できないこと' do
        @order_purchase.phone_number = '０９０１２３４５６７８'
        @order_purchase.valid?
        expect(@order_purchase.errors.full_messages).to include("Phone number is invalid.")
      end

      it 'user_idが空だと保存できないこと' do
        @order_purchase.user_id = nil
        @order_purchase.valid?
        expect(@order_purchase.errors.full_messages).to include("User can't be blank")
      end

      it 'item_idが空だと保存できないこと' do
        @order_purchase.item_id = nil
        @order_purchase.valid?
        expect(@order_purchase.errors.full_messages).to include("Item can't be blank")
      end
    
      it "tokenが空では登録できないこと" do
        @order_purchase.token = nil
        @order_purchase.valid?
        expect(@order_purchase.errors.full_messages).to include("Token can't be blank")
      end

    end
  end
end
