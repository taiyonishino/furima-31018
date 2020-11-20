class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @purchaces_user = PurchacesUser.new
  end


 
  def create
    @item = Item.find(order_params[:item_id])
    @purchaces_user = PurchacesUser.new(order_params) 
    if @purchaces_user.valid?
      pay_item
      @purchaces_user.save
      return redirect_to root_path
    else
      render :index
    end
  end
 
 private
 
  def order_params
   params.require(:purchaces_user).permit(:postal_code, :prefecture_id, :municipality, :address, :building_name, :phone_number, :prace).merge(user_id: current_user.id, item_id: params[:item_id] ,token: params[:token])
  end

  def pay_item

    @item = Item.find(order_params[:item_id])
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.prace,  # 商品の値段
      card: order_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end


end
