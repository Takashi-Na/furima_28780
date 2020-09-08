class OrdersController < ApplicationController
  before_action :set_item, only: [:index, :create]
  before_action :move_to_index, only: [:index]

  def index
    @order = OrderAddress.new
  end

  def create
    @order = OrderAddress.new(order_params)
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
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,           # 商品の値段
      card: order_params[:token],    # カードトークン
      currency:'jpy'                 # 通貨の種類(日本円)
    )
  end

  def order_params
    params.permit(:post_code, :prefecture, :city, :address, :building_name, :tel_num).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def move_to_index
    # sign_inしていないと購入ページに遷移できない
    redirect_to new_user_session_path unless user_signed_in?
    # 出品者が購入ページに遷移できない
    if current_user.id == @item.user_id
      redirect_to root_path
    # 購入済みの商品の購入ページに遷移できない
    elsif Order.exists?(item_id: @item.id)
      redirect_to root_path
    end
  end
end
