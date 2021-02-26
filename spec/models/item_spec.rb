require 'rails_helper'

RSpec.describe Item, type: :model do
  describe "出品機能のテスト" do
    before do
      @item = FactoryBot.build(:item)
    end
    
    context "出品ができるとき" do
      it "全ての項目を入力すれば出品ができる" do
        expect(@item.user).to be_valid
      end
    end

    context "出品ができないとき" do
      it "商品名が空だと出品ができない" do
        @item.name = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it "商品説明が空だと出品ができない" do
        @item.describe = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Describe can't be blank")
      end

      it "商品画像が空だと出品ができない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it "カテゴリ --- だと出品ができない" do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end

      it "商品の状態が --- だと出品ができない" do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Status must be other than 1")
      end

      it "配送料の負担が空だと出品ができない" do
        @item.deliveryfee_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Deliveryfee must be other than 1")
      end

      it "発送元の地域が空だと出品ができない" do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture must be other than 1")
      end

      it "発送までの日数が空だと出品ができない" do
        @item.deliveryday_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Deliveryday must be other than 1")
      end

      it "販売価格が空だと出品ができない" do
        @item.price = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it "販売価格が 300円 未満だと出品ができない" do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not included in the list")
      end

      it "販売価格が 10,000,000円 以上だと出品ができない" do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not included in the list")
      end

      it "販売価格が 全角数字 だと出品ができない" do
        @item.price = "５０００"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not included in the list")
      end
    end
  end
end
