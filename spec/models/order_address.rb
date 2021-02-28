require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe "購入情報と購入者住所の保存" do
    
    before do
      @user = FactoryBot.create(:user)
      @item = FactoryBot.create(:item)
      @order_address = FactoryBot.build(:order_address, user_id: @user.id, item_id: @item.id)
      sleep 0.3
    end
    
    context "Ordersとaddressesテーブルに保存ができること" do
      it "全ての値があれば保存ができる" do
        expect(@order_address).to be_valid
      end

      it "building が空でも保存ができること" do
        @order_address.building = ""
        @order_address.valid?
        expect(@order_address).to be_valid
      end

      it "phone_number が11桁で保存ができること" do
        @order_address.phone_number = "01234567890"
        @order_address.valid?
        expect(@order_address).to be_valid
      end

      it "phone_number が10桁で保存ができること" do
        @order_address.phone_number = "0123456789"
        @order_address.valid?
        expect(@order_address).to be_valid
      end
    end
    
    context "購入情報及び購入者住所が保存できないこと" do
      it "postal_codeが空だと保存ができない" do
        @order_address.postal_code = ""
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code can't be blank")
      end

      it "postal_codeのハイフンがないと保存ができないこと" do
        @order_address.postal_code = "0000000"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end
      
      it "postal_codeの桁数が違うと保存ができないこと" do
        @order_address.postal_code = "000-00000"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end

      it "prefecture_idが空だと保存できない" do
        @order_address.prefecture_id = ""
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Prefecture can't be blank")
      end

      it "prefecture_idが 0 だと保存できない" do
        @order_address.prefecture_id = 0
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Prefecture can't be blank")
      end

      it "phone_numberが空だと保存ができない" do
        @order_address.phone_number = ""
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number can't be blank")
      end

      it "phone_numberの桁が違うと保存ができない" do
        @order_address.phone_number = "123"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number is invalid")
      end

      it "phone_numberにハイフンが入ると保存ができない" do
        @order_address.phone_number = "000-0000-0000"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number is invalid")
      end

      it "item_idがなければ保存ができないこと" do
        @order_address.item_id = ""
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Item can't be blank")
      end

      it "user_idがなければ保存ができないこと" do
        @order_address.user_id = ""
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("User can't be blank")
      end

      it "tokenが空だと保存ができないこと" do
        @order_address.token = ""
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
