class OrdersController < ApplicationController
  before_action :authenticate_user!, only: :index
  before_action :set_item ,only: [:index, :create,:pay_item]
  
  def index
    if current_user == @item.user || @item.purchace != nil
      redirect_to root_path
    end
    @purchaces_user = PurchacesUser.new
  end
 
  def create
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
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.prace,  # 商品の値段
      card: order_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

end
