require 'rails_helper'
RSpec.describe OrderAddress, type: :model do
  before do
    @order_address = FactoryBot.build(:order_address)
  end

  describe 'OrderAddress登録' do
    context '登録がうまくいくとき' do
      it 'token, post_code, prefecture, city, address, tel_num,が存在すれば登録できる' do
        expect(@order_address).to be_valid
      end
      it 'building_nameが空でも登録できる' do
        @order_address.building_name = nil
        expect(@order_address).to be_valid
      end
    end

    context '登録がうまくいかないとき' do
      it 'tokenが空だと登録できない' do
        @order_address.token = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end
      it 'post_codeが空だと登録できない' do
        @order_address.post_code = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Post code can't be blank")
      end
      it 'post_codeが-(hyphen)がないと登録できない' do
        @order_address.post_code = '1234567'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Post code is invalid. Include hyphen(-)')
      end
      it 'prefectureが「−−−」だと登録できない' do
        @order_address.prefecture = '0'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Prefecture select')
      end
      it 'cityが空だと登録できない' do
        @order_address.city = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("City can't be blank")
      end
      it 'addressが空だと登録できない' do
        @order_address.address = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Address can't be blank")
      end
      it 'tel_numが空だと登録できない' do
        @order_address.tel_num = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Tel num can't be blank")
      end
      it 'tel_numが10桁か11桁でないと登録できない' do
        @order_address.tel_num = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Tel num has to be 10 to 11 digits')
      end
    end
  end
end
