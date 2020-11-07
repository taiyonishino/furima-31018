require 'rails_helper'
describe Item do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品' do

    context '商品出品がうまくいくとき' do
      it '販売価格が半角数字の時出品できる' do
        @item.prace = 4000
        expect(@item).to be_valid
      end
    end

    context '商品出品がうまくいかないとき' do
      it "商品画像が空の時出品できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      
      it "商品の名前が空の時出品できない" do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
  
      it "商品の説明が空の時出品できない" do
        @item.explanation = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Explanation can't be blank")
      end

      it "カテゴリーのidが0の時出品できない" do
        @item.category_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 0")
      end

      it "商品の状態のidが0の時出品できない" do
        @item.status_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Status must be other than 0")
      end

      it "配送元の地域のidが0の時出品できない" do
        @item.prefecture_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture must be other than 0")
      end

      it "配送料の負担のidが0の時出品できない" do
        @item.burden_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Burden must be other than 0")
      end

      it "配送までの日数のidが0の時出品できない" do
        @item.days_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Days must be other than 0")
      end

      it "価格が300円以下の時出品できない" do
        @item.prace = 30
        @item.valid?
        expect(@item.errors.full_messages).to include("Prace is out of setting range")
      end

      it "販売価格が999万9999円以上の時出品できない" do
        @item.prace = 1000000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Prace is out of setting range")
      end

      it "販売価格が半角数字の時出品できない" do
        @item.prace = "aaa"
        @item.valid?
        expect(@item.errors.full_messages).to include("Prace is out of setting range")
      end
    end
  end    
end