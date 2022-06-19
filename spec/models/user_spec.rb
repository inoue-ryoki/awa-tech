require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

   describe 'ユーザー新規登録' do
    context '新規登録できる場合' do
      it 'nameとemail、passwordとpassword_confirmation,school_name,address,telephone_number,teacher_name,school_contentが存在すれば登録できる' do
        expect(@user).to be_valid
      end

      it 'schoo_nameが空でも登録できる' do
        @user.school_name = ''
        expect(@user).to be_valid
      end


      it 'addressが空でも登録できる' do
        @user.address = ''
        expect(@user).to be_valid
      end

      it 'telephone_numberが空でも登録できる' do
        @user.telephone_number = ''
        expect(@user).to be_valid
      end
      it 'teacher_nameが空でも登録できる' do
        @user.teacher_name = ''
        expect(@user).to be_valid
      end

      it 'school_contentが空でも登録できる' do
        @user.school_content = ''
        expect(@user).to be_valid
      end



    end
    context '新規登録できない場合' do
      it 'nameが空では登録できない' do
        @user.name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Name can't be blank")
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'emailが一意性でなければ登録できない' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'emailは@を含まなければ登録できない' do
        @user.email = 'testmail'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it 'passwordが5文字以下では登録できない' do
        @user.password = '00000'
        @user.password_confirmation = '00000'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end

      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '1234567'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

    end
 end


end
