require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    it 'nicknameが空では登録できない' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Nickname can't be blank"
    end
    it 'emailが空では登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Email can't be blank"
    end
    it '重複したemailは登録できない' do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end
    it 'メールアドレスに@を含まない場合は登録できない' do
      @user.email = 'test.com'
      @user.valid?
      expect(@user.errors.full_messages).to include "Email is invalid"
    end
    it 'passwordが空では登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Password can't be blank"
    end
    it 'passwordが英字のみの場合登録できない' do
      @user.password = 'aaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include "Password must consist of more than six alphanumeric characters"
    end
    it 'passwordが数字のみの場合登録できない' do
      @user.password = '111111'
      @user.valid?
      expect(@user.errors.full_messages).to include "Password must consist of more than six alphanumeric characters"
    end
    it 'passwordが6文字未満では登録できない' do
      @user.password = 'aaa11'
      @user.valid?
      expect(@user.errors.full_messages).to include "Password is too short (minimum is 6 characters)"
    end
    it 'passwordと確認用パスワードの値が不一致の場合登録できない' do
      @user.password = 'aaaa11'
      @user.password_confirmation = 'bbbb11'
      @user.valid?
      expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
    end
    it 'family_nameが空では登録できない' do
      @user.family_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Family name can't be blank"
    end
    it 'family_nameが半角文字では登録できない' do
      @user.family_name = 'yamada'
      @user.valid?
      expect(@user.errors.full_messages).to include "Family name please enter in full width characters"
    end
    it 'first_nameが空では登録できない' do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "First name can't be blank"
    end
    it 'first_nameが半角文字では登録できない' do
      @user.first_name = 'yamada'
      @user.valid?
      expect(@user.errors.full_messages).to include "First name please enter in full width characters"
    end
    it 'kana_family_nameが空では登録できない' do
      @user.kana_family_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Kana family name can't be blank"
    end
    it 'kana_family_nameが全角カタカナ以外では登録できない' do
      @user.kana_family_name = 'やまだ'
      @user.valid?
      expect(@user.errors.full_messages).to include "Kana family name please enter in full width katakana"
    end
    it 'kana_first_nameが空では登録できない' do
      @user.kana_first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Kana first name can't be blank"
    end
    it 'kana_first_nameが全角カタカナ以外では登録できない' do
      @user.kana_first_name = 'やまだ'
      @user.valid?
      expect(@user.errors.full_messages).to include "Kana first name please enter in full width katakana"
    end
    it 'date_of_birthが空では登録できない' do
      @user.date_of_birth = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Date of birth can't be blank"
    end
  end
end
