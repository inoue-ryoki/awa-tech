require 'rails_helper'

RSpec.describe Message, type: :model do
  before do
    @message = FactoryBot.build(:message)
    sleep 0.3
  end

  describe 'メッセージ時の投稿' do
    context 'メッセージの投稿ができる場合' do
      it 'contentが空でなければ投稿できる' do
        expect(@message).to be_valid
      end
    end
    context 'メッセージの投稿ができない場合' do
      it 'contentが空では投稿できない' do
        @message.content = ''
        @message.valid?
        expect(@message.errors.full_messages).to include("Content can't be blank")
      end

      it 'userが紐付いていないと保存できない' do
        @message.user = nil
        @message.valid?
        expect(@message.errors.full_messages).to include('User must exist')
      end

      it 'roomが紐付いていないと保存できない' do
        @message.room = nil
        @message.valid?
        expect(@message.errors.full_messages).to include('Room must exist')
      end
    end
  end
end
