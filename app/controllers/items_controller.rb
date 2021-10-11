class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]
  before_action :set_item, only: [:edit, :update, :show, :destroy]
  before_action :contributor_confirmation, only: [:edit, :update]
  

  def index
    @item = Item.includes(:user).order(created_at: :desc)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.valid?
       @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  def destroy
    if current_user.id == @item.user_id
       @item.destroy
       redirect_to root_path
    else
      render :show
    end
  end



  private
  def item_params
    params.require(:item).permit(:image,:item_name, :explanation, :category_id, :condition_id,:shipping_id,:prefecture_id,:delivery_id,:item_price).merge(user_id: current_user.id)
  end
    def contributor_confirmation
      redirect_to root_path if @item.user != current_user || @item.buy_item != nil
    end
    def set_item
      @item = Item.find(params[:id])
    end
end

