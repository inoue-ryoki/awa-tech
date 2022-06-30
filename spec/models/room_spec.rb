require 'rails_helper'

RSpec.describe Room, type: :model do
  before do
    @room = FactoryBot.build(:room)
    sleep 0.3
  end

  describe 'ルームの作成' do
    context 'ルームの作成ができる場合' do
      it 'ルームの作成ができる' do
        expect(@room).to be_valid
      end
    end
    context 'ルームの作成ができない場合' do
    end
  end
end
