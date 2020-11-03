require 'rails_helper'
describe User do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいかないとき' do
      it "nicknameが空だと登録できない" do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      it "emailが空では登録できない" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it "重複したemailが存在する場合登録できない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end

      it "passwordが空では登録できない" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it "passwordが5文字以下であれば登録できない" do
        @user.password = "00000"
        @user.password_confirmation = "00000"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end

      it "passwordが存在してもpassword_confirmationが空では登録できない" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it "ユーザー本名の名字が空では登録できない" do
        @user.family_name_china = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name china can't be blank")
      end

      it "ユーザー本名の名前が空では登録できない" do
        @user.first_name_china = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name china can't be blank")
      end

      it "ユーザー本名の名字が全角(漢字・ひらがな・カタカナ)でないと登録できない" do
        @user.family_name_china = '000'
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name china 全角（漢字・ひらがな・カタカナ）文字を使用してください")
      end

      it "ユーザー本名の名前が全角(漢字・ひらがな・カタカナ)でないと登録できない" do
        @user.first_name_china = '000'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name china 全角（漢字・ひらがな・カタカナ）文字を使用してください")
      end

      it "ユーザー本名のフリガナの名字が空では登録できない" do
        @user.family_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name kana can't be blank")
      end

      it "ユーザー本名のフリガナの名前が空では登録できない" do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end

      it "ユーザー本名の名字が全角(カタカナ)でないと登録できない" do
        @user.family_name_kana = '000'
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name kana 全角(カナカナ)文字を使用してください")
      end

      it "ユーザー本名の名字が全角(カタカナ)でないと登録できない" do
        @user.first_name_kana = '000'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana 全角(カナカナ)文字を使用してください")
      end

      it "生年月日が空では登録できない" do
      @user.birthday = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end

      it 'パスワードが半角英語のみでは登録できない)' do
        @user.password = 'aaaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'パスワードが数字のみでは登録ができない' do
        @user.password = '1111111'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it "emailに＠が含まれていない場合に登録ができない" do
        @user.email = 'aaaaaaaaa'
        @user.valid?
        binding.pry
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
    end
  end
end
