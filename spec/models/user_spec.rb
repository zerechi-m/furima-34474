require 'rails_helper'

RSpec.describe User, type: :model do
  describe "ユーザー登録" do
    before do
      @user = FactoryBot.build(:user)
    end

    context "ユーザー登録できる時" do
      it "全ての値が存在していれば登録できる" do
        expect(@user).to be_valid
      end
    end

    context "ユーザー登録できないとき" do
      
      it "nicknameが空だと登録できない" do
        @user.nickname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      
      it "メールアドレスが空だと登録できない" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      
      it "メールアドレスに@が含まれないと登録できない" do
        @user.email = "testtesttest.co.jp"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      
      it "メールアドレスが重複すると登録できない" do
        another_user = FactoryBot.create(:user)
        @user.email = another_user.email
        @user.valid?
        expect(@user.errors.full_messages).to include("Email has already been taken")
      end
      
      it "パスワードが空だと登録できない" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      
      it "パスワードが5文字以下だと登録できない" do
        @user.password = "1111a"
        @user.password_confirmation = "1111a"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      
      it "パスワードが全角だと登録できない" do
        @user.password = "ｔｅｓｕｔｏｄｅｓｕ１"
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include("Password passwordには半角英数字混合で入力してください")
      end
      
      it "パスワードが数字だけだと登録できない" do
        @user.password = "111111"
        @user.password_confirmation = "111111"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password passwordには半角英数字混合で入力してください")
      end
      
      it "パスワードが英字だけだと登録できない" do
        @user.password = "aaaaaa"
        @user.password_confirmation = "aaaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password passwordには半角英数字混合で入力してください")
      end
      
      it "確認用パスワードが空だと登録できない" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      
      it "パスワードと確認用パスワードが不一致だと登録できない" do
        @user.password = "aaaaaa1"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      
      it "苗字が空だと登録できない" do
        @user.last_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      
      it "名前が空だと登録できない" do
        @user.first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      
      it "苗字に英数字が入ると登録できない" do
        @user.last_name = "テスト1"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name 漢字・ひらがな・カタカナ可能")
      end
      
      it "名前に英数字が入ると登録できない" do
        @user.first_name = "テスト1"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name 漢字・ひらがな・カタカナ可能")
      end
      
      it "苗字カナが空だと登録できない" do
        @user.last_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank")
      end
      
      it "名前カナが空だと登録できない" do
        @user.first_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end
      
      it "苗字カナに英数字が入ると登録できない" do
        @user.last_name_kana = "テスト1"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana 全角文字を使用してください")
      end
      
      it "名前カナに英数字が入ると登録できない" do
        @user.first_name_kana = "テスト1"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana 全角文字を使用してください")
      end
      
      it "生年月日が空だと登録できない" do
        @user.birthday = "1990---11"
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end


