require 'rails_helper'

RSpec.describe Post, type: :model do
  before do
    @post = FactoryBot.build(:post)
    sleep 0.3
  end

   describe '教室情報の投稿' do
    context '教室情報の投稿ができる場合' do
      it 'textとimageが空でなければ投稿できる' do
        expect(@post).to be_valid
      end





    end
    context '教室情報の投稿ができない場合' do
      it 'textが空では登録できない' do
        @post.text = ''
        @post.valid?
        expect(@post.errors.full_messages).to include("Text can't be blank")
      end
      it 'imageが空では登録できない' do
        @post.image = nil
        @post.valid?
        expect(@post.errors.full_messages).to include("Image can't be blank")
      end
      it 'textとimageが空では登録できない' do
        @post.text = ''
        @post.image = nil
        @post.valid?
        expect(@post.errors.full_messages).to include("Image can't be blank", "Text can't be blank")

      end

        it 'userが紐付いていないと保存できない' do
        @post.user = nil
        @post.valid?
        expect(@post.errors.full_messages).to include('User must exist')

      end



    end
  end
end
