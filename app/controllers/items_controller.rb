class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]
  before_action :set_item, only:[:show, :edit]  

  def index
    @items = Item.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to '/'
    else
      render new_item_path
    end
  end

  def show
  end

  def edit
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(
      :image, :item_name, :price, :text, :category_id, :condition_id,
      :shipping_fee_id, :prefecture_id, :shipping_date_id
    ).merge(user_id: current_user.id)
  end
end
