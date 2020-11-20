require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it "nicknameとemail、passwordとpassword_confirmationとlast_nameとfirst_nameとlast_name_kanaとfirst_name_kanaとbirth_dateが存在すれば登録できること" do
        expect(@user).to be_valid
      end

      it "nicknameが空では登録できないこと" do
        @user.nickname = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      it "emailが空では登録できないこと" do
        @user.email = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it "emailは@がないと登録できないこと" do
        @user.email = "abc.co.jp"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end

      it "passwordが空では登録できないこと" do
        @user.password = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it "passwordが6文字以上であれば登録できること" do
        @user.password = "111aaa"
        @user.password_confirmation = "111aaa"
        @user.valid?
        expect(@user).to be_valid
      end

      it "passwordが5文字以下であれば登録できないこと" do
        @user.password = "111aa"
        @user.password_confirmation = "111aa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end

      it "passwordは半角英数字混合でないと登録できないこと" do
        @user.password = "000000"
        @user.password_confirmation = "000000"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid.")
      end

      it "passwordは半角英数字混合でないと登録できないこと" do
        @user.password = "aaaaaa"
        @user.password_confirmation = "aaaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid.")
      end

      it "passwordとpassword_confirmationが不一致では登録できないこと" do
        @user.password = "111aaa"
        @user.password_confirmation = "111bbb"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it "重複したemailが存在する場合登録できないこと" do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end

      it "birth_dateが空では登録できないこと" do
        @user.birth_date = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth date can't be blank")
      end

      it "last_nameだけでは登録できないこと" do
        @user.first_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank", "First name is invalid.")
      end
      
      it "first_nameだけでは登録できないこと" do
        @user.last_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank", "Last name is invalid.")
      end

      it "last_nameは全角（漢字・ひらがな・カタカナ）でないと登録できないこと" do
        @user.last_name = "test"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name is invalid.")
      end

      it "first_nameは全角（漢字・ひらがな・カタカナ）でないと登録できないこと" do
        @user.first_name = "test"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name is invalid.")
      end

      it "last_name_kanaだけでは登録できないこと" do
        @user.first_name_kana = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank", "First name kana is invalid.")
      end
      
      it "first_name_kanaだけでは登録できないこと" do
        @user.last_name_kana = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank", "Last name kana is invalid.")
      end

      it "last_name_kanaは全角カタカナでないと登録できないこと" do
        @user.last_name_kana = "ｶﾀｶﾅ"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana is invalid.")
      end

      it "first_nameは全角カタカナでないと登録できないこと" do
        @user.first_name_kana = "ｶﾀｶﾅ"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana is invalid.")
      end

    end
  end
end