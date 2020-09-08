class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @order = OrderAddress.new
  end

  def create
    @order = OrderAddress.new(order_params)
    @item = Item.find(params[:item_id])
    if @order.valid?
      pay_item
      @order.save
      redirect_to root_path
    else
      render "index"
    end
  end

  private

  def pay_item
    Payjp.api_key = "sk_test_785e9814c7a62311027b0c18"
    Payjp::Charge.create(
      amount: @item.price,           # 商品の値段
      card: order_params[:token],    # カードトークン
      currency:'jpy'                 # 通貨の種類(日本円)
    )
  end

  def order_params
    params.permit(:post_code, :prefecture, :city, :address, :building_name, :tel_num).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end
end
