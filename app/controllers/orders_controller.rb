class OrdersController < ApplicationController
  before_action :authenticate_user!,only: [:index, :create]

  def index
    @item = Item.find(params[:item_id])
    @order = Order.new
    if current_user == @item.user || @item.buy_item != nil
      redirect_to root_path
    end
  end

  def create
    @item = Item.find(params[:item_id])
    @order = Order.new(order_params)
    if @order.valid?
      pay_item
      @order.save
     redirect_to root_path
   else
     render :index
   end
  end

  def order_params
    params.require(:order)
    .permit(:post_code, :prefecture_id, :city, :city_address, :building_name, :phone_number)
    .merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = "sk_test_b7a18440bf1e1bffb6c89886"  # 自身のPAY.JPテスト秘密鍵を記述しましょう
    Payjp::Charge.create(
      amount: @item.item_price,  # 商品の値段
      card: order_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end
end
