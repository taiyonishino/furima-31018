class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index ,:show]
  before_action :set_item ,only: [:show, :edit, :update]

  def index
    @items = Item.all.order("created_at DESC")
  end

  def new
    @item = Item.new 
  end

  def create
    @item = Item.create(item_params)
    if  @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
    unless current_user == @item.user
      redirect_to root_path
    end
  end

  def update
   if @item.update(item_params)
      redirect_to item_path(@item.id)
   else
       render :edit
     end
   end

private
  def item_params
    params.require(:item).permit(:image ,:name, :explanation ,:category_id, :status_id, :burden_id, :prefecture_id, :days_id, :prace,).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end