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
    end
  end
end