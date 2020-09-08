class OrderAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :token, :post_code, :prefecture, :city, :address, :building_name, :tel_num, :order

  # カード情報と住所のバリデーション
  with_options presence: true do
    validates :post_code,  format:       { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :prefecture, numericality: { other_than: 0 , message: "select" }
    validates :tel_num,    format:       { with: /\A[0-9]{10,11}\z/, message: "has to be 10 to 11 digits"}
    validates :user_id, :item_id, :token, :city, :address
  end

  def save
    # カード情報の保存
    order = Order.create( user_id: user_id, item_id: item_id )
    # 住所の保存
    Address.create( post_code: post_code, prefecture: prefecture, city: city, address: address, building_name: building_name, tel_num: tel_num ,order_id: order.id )
  end
end