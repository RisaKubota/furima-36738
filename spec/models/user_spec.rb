require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できる場合' do
      it "必要事項を正しく入力できれば登録できる" do
        expect(@user).to be_valid
      end

    end

    context '新規登録できない場合' do
      it "nicknameが空だと登録できない" do
        @user.nickname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Nickname can't be blank"
      end
      it "emailが空では登録できない" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Email can't be blank"
      end
      it "passwordが空では登録できない" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Password can't be blank"
      end
      it "name1が空では登録できない" do
        @user.name1 = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Name1 can't be blank"
      end
      it "name2が空では登録できない" do
        @user.name2 = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Name2 can't be blank"
      end
      it "furigana1が空では登録できない" do
        @user.furigana1 = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Furigana1 can't be blank"
      end
      it "furigana2が空では登録できない" do
        @user.furigana2 = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Furigana2 can't be blank"
      end
      it "birthdayが空では登録できない" do
        @user.birthday = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Birthday can't be blank"
      end
      it  "重複したemailが存在する場合登録できない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include "Email has already been taken"
      end
      it  "emailに＠が含まれない場合は登録出来ない" do
        @user.email = "testtest.com"
        @user.valid?
        expect(@user.errors.full_messages).to include "Email is invalid"
      end
      it "passwordは5文字以下では登録できない" do
        @user.password = "aaaa"
        @user.password_confirmation = "aaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include "Password is too short (minimum is 6 characters)"
      end
      it "passwordは英語のみでは登録できない" do
        @user.password = "aaaaaa"
        @user.password_confirmation = "aaaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include "Password is invalid"
      end
      it "passwordは数字のみでは登録できない" do
        @user.password = "111111"
        @user.password_confirmation = "111111"
        @user.valid?
        expect(@user.errors.full_messages).to include "Password is invalid"
      end
      it "passwordは全角では登録できない" do
        @user.password = "１１１１ＡＡ"
        @user.password_confirmation = "１１１１ＡＡ"
        @user.valid?
        expect(@user.errors.full_messages).to include "Password is invalid"
      end
      it "name1は英数字の登録はできない" do
        @user.name1 = "ABC123"
        @user.valid?
        expect(@user.errors.full_messages).to include "Name1 is invalid"
      end
      it "name2は英数字の登録はできない" do
        @user.name2 = "ABC123"
        @user.valid?
        expect(@user.errors.full_messages).to include "Name2 is invalid"
      end
      it "furigana1は全角カタカナ以外では登録できない" do
        @user.furigana1 = "あああ眠々"
        @user.valid?
        expect(@user.errors.full_messages).to include "Furigana1 is invalid"
      end
      it "furigana2は全角カタカナ以外では登録できない" do
        @user.furigana2 = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Furigana2 is invalid"
      end
    end
  end
end