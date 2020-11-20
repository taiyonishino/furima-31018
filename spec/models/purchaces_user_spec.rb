require 'rails_helper'
describe PurchacesUser do
  before do
    @user = FactoryBot.build(:user)
    @purchaces_user = FactoryBot.build(:purchaces_user, user_id: @user.id)
  end

   context '購入情報の保存がうまくいくとき' do

     it '電話番号にハイフンがなくても保存できる' do
      @purchaces_user.phone_number = "01234567890"
      expect(@purchaces_user).to be_valid
     end

     it 'building_nameは空でも保存できること' do
      @purchaces_user.building_name = ""
      expect(@purchaces_user).to be_valid
     end
   end

  context '購入情報の保存が上手くできない' do

     it '郵便番号が空だと保存できない' do
      @purchaces_user.postal_code = ""
        @purchaces_user.valid?
        expect(@purchaces_user.errors.full_messages).to include("Postal code can't be blank")
     end

     it 'prefecture_idが0だと保存できない' do
      @purchaces_user.prefecture_id = 0
        @purchaces_user.valid?
        expect(@purchaces_user.errors.full_messages).to include("Prefecture must be other than 0")
     end

     it '市区町村が空だと保存できない' do
      @purchaces_user.municipality = ""
        @purchaces_user.valid?
        expect(@purchaces_user.errors.full_messages).to include("Municipality can't be blank")
     end

     it '番地が空だと保存できない' do
      @purchaces_user.address = ""
        @purchaces_user.valid?
        expect(@purchaces_user.errors.full_messages).to include("Address can't be blank")
     end

     it '電話番号が空だと保存できない' do
      @purchaces_user.phone_number = ""
        @purchaces_user.valid?
        expect(@purchaces_user.errors.full_messages).to include("Phone number can't be blank")
     end

     it '郵便番号にハイフンがなければ保存できない' do
      @purchaces_user.postal_code = "1234567"
        @purchaces_user.valid?
        expect(@purchaces_user.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
     end

     it '電話番号が11桁以上だと保存できない' do
      @purchaces_user.phone_number = "123456789123"
        @purchaces_user.valid?
        expect(@purchaces_user.errors.full_messages).to include("Phone number 11桁以上だと保存できません")
     end

   it "tokenが空では登録できないこと" do
     @purchaces_user.token = nil
     @purchaces_user.valid?
     expect(@purchaces_user.errors.full_messages).to include("Token can't be blank")
   end
  end
end
