class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]

  def index
    @items = Item.all.order('created_at DESC')
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

  private

  def item_params
    params.require(:item).permit(
      :image, :item_name, :price, :text, :category_id, :condition_id,
      :shipping_fee_id, :prefecture_id, :shipping_date_id
    ).merge(user_id: current_user.id)
  end
end
