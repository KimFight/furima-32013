require 'rails_helper'
# bundle exec rspec spec/models/item_spec.rb 
RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品登録' do

    context '商品登録ができる時' do

      it "name、explanation、category_id、status_id、delivery_burden_id、shipment_source_id、day_id、price、imageが存在すれば登録できること" do
        expect(@item).to be_valid
      end

      it "priceは半角数字ならば登録できること" do
        @item.price = "333"
        @item.valid?
        expect(@item).to be_valid
      end

    end
    
    context '商品登録ができない時' do

      it "nemeが空では登録できないこと" do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it "imageが空では登録できないこと" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it "explanationが空では登録できないこと" do
        @item.explanation = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Explanation can't be blank")
      end

      it "category_idが空では登録できないこと" do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank", "Category is not a number")
      end

      it "category_idが1では登録できないこと" do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end

      it "status_idが空では登録できないこと" do
        @item.status_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Status can't be blank", "Status is not a number")
      end

      it "status_idが1では登録できないこと" do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Status must be other than 1")
      end

      it "delivery_burden_idは空では登録できないこと" do
        @item.delivery_burden_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery burden can't be blank", "Delivery burden is not a number")
      end

      it "delivery_burden_idが1では登録できないこと" do
        @item.delivery_burden_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery burden must be other than 1")
      end

      it "shipment_source_idは空では登録できないこと" do
        @item.shipment_source_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipment source can't be blank", "Shipment source is not a number")
      end

      it "shipment_source_idが1では登録できないこと" do
        @item.shipment_source_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipment source must be other than 1")
      end

      it "day_idは空では登録できないこと" do
        @item.day_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Day can't be blank", "Day is not a number")
      end

      it "day_idが1では登録できないこと" do
        @item.day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Day must be other than 1")
      end

      it "priceは空では登録できないこと" do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it "priceは半角数字でないと登録できないこと" do
        @item.price = "１０００"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end

      it "priceが300以下では登録できないこと" do
        @item.price = 200
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than 299")
      end

      it "priceが10,000,000以上だと登録できないこと" do
        @item.price = 11111111
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than 10000000")
      end

    end
  end
end