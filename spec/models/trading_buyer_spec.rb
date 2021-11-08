require 'rails_helper'

RSpec.describe TradingBuyer, type: :model do
  describe '取引情報の保存' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @trading_buyer = FactoryBot.build(:trading_buyer, user_id: user.id, item_id: item.id)
      sleep(0.5) # Mysqlエラー回避のため
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できる' do
        expect(@trading_buyer).to be_valid
      end
      it '建物名がなくても保存できる' do
        @trading_buyer.building_name = ''
        expect(@trading_buyer).to be_valid
      end
    end

    context '内容に問題ある場合' do
      it 'tokenがないと保存できない' do
        @trading_buyer.token = ''
        @trading_buyer.valid?
        expect(@trading_buyer.errors.full_messages).to include("Token can't be blank")
      end
      it '郵便番号がないと保存できない' do
        @trading_buyer.post_number = ''
        @trading_buyer.valid?
        expect(@trading_buyer.errors.full_messages).to include("Post number can't be blank")
      end
      it '郵便番号にハイフンがないと保存できない' do
        @trading_buyer.post_number = '1234567'
        @trading_buyer.valid?
        expect(@trading_buyer.errors.full_messages).to include('Post number is invalid. Enter it as follows (e.g. 123-4567)')
      end
      it '郵便番号が全角数字だと保存できない' do
        @trading_buyer.post_number = '１２３-４５６７'
        @trading_buyer.valid?
        expect(@trading_buyer.errors.full_messages).to include('Post number is invalid. Enter it as follows (e.g. 123-4567)')
      end
      it '都道府県が１だと保存できない' do
        @trading_buyer.prefecture_id = '1'
        @trading_buyer.valid?
        expect(@trading_buyer.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '市区町村がないと保存できない' do
        @trading_buyer.city = ''
        @trading_buyer.valid?
        expect(@trading_buyer.errors.full_messages).to include("City can't be blank")
      end
      it '番地がないと保存できない' do
        @trading_buyer.address = ''
        @trading_buyer.valid?
        expect(@trading_buyer.errors.full_messages).to include("Address can't be blank")
      end
      it '電話番号がないと保存できない' do
        @trading_buyer.phone_number = ''
        @trading_buyer.valid?
        expect(@trading_buyer.errors.full_messages).to include("Phone number can't be blank")
      end
      it '電話番号が10桁未満だと保存できない' do
        @trading_buyer.phone_number = '123456789'
        @trading_buyer.valid?
        expect(@trading_buyer.errors.full_messages).to include('Phone number is too short')
      end
      it '電話番号が全角数字だと保存できない' do
        @trading_buyer.phone_number = '１２３４５６７８９０'
        @trading_buyer.valid?
        expect(@trading_buyer.errors.full_messages).to include('Phone number is invalid. Input only number')
      end
      it '電話番号にハイフンがあると保存できない' do
        @trading_buyer.phone_number = '123-4567-8901'
        @trading_buyer.valid?
        expect(@trading_buyer.errors.full_messages).to include('Phone number is invalid. Input only number')
      end
      it 'userが紐づいていなければ保存できない' do
        @trading_buyer.user_id = nil
        @trading_buyer.valid?
        expect(@trading_buyer.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐づいていなければ保存できない' do
        @trading_buyer.item_id = nil
        @trading_buyer.valid?
        expect(@trading_buyer.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
