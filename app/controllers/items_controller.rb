class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]
  def index
    # @item =Item.includes(:user)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def item_params
    params.require(:item).permit(:image,:item_name, :explanation, :category_id, :condition_id,:shipping_id,:prefecture_id,:delivery_id,:item_price).merge(user_id: current_user.id)
    # params[:item].permit(:image,:item_name, :explanation, :category_id, :condition_id,:shipping_id,:send_id,:delivery_id,:item_price)
  end
  
end
