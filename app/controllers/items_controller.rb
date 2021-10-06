class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]
  before_action :contributor_confirmation, only: [:edit, :update]
  def index
    @item = Item.includes(:user)
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

  def show
    @item =Item.find(params[:id])
  end

  def edit
    @item =Item.find(params[:id])
  end

  def update
    @item =Item.find(params[:id])
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  private
  def item_params
    params.require(:item).permit(:image,:item_name, :explanation, :category_id, :condition_id,:shipping_id,:prefecture_id,:delivery_id,:item_price).merge(user_id: current_user.id)
  end
    def contributor_confirmation
      @item =Item.find(params[:id])
      redirect_to root_path unless @item.user == current_user
    end
end

