class TradingsController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :set_item, only:[:index, :create]
  before_action :move_to_index, only:[:index, :create]


  def index
    @trading_buyer = TradingBuyer.new
  end
  
  def create
    @trading_buyer = TradingBuyer.new(trading_params)
    if @trading_buyer.valid?
      pay_item
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

  def move_to_index
    if @item.user_id == current_user.id || @item.trading.present? 
      redirect_to root_path
    end   
  end

  def trading_params
    params.require(:trading_buyer).permit(
      :post_number, :prefecture_id, :city, :address, :building_name, :phone_number
    ).merge(user_id: current_user.id, item_id: @item.id, token: params[:token])
  end
  
  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: trading_params[:token],
      currency: 'jpy'
    )
  end
end
