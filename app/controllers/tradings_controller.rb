class TradingsController < ApplicationController
  before_action :set_item, only:[:index, :create]

  def index
    @trading_buyer = TradingBuyer.new
  end
  
  def create
    @trading_buyer = TradingBuyer.new(trading_params)
    if @trading_buyer.valid?
      @trading_buyer.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def trading_params
    params.require(:trading_buyer).permit(
      :post_number, :prefecture_id, :city, :address, :building_name, :phone_number
    ).merge(user_id: current_user.id, item_id: @item.id)
  end
end
