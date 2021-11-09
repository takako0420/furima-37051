class TradingBuyer
  include ActiveModel::Model
  attr_accessor :item_id, :user_id, :post_number, :prefecture_id, :city, :address, :building_name, :phone_number, :trading_id,
                :token

  with_options presence: true do
    validates :item_id
    validates :user_id
    validates :token
    validates :post_number, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Enter it as follows (e.g. 123-4567)' }
    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :city
    validates :address
    validates :phone_number, numericality: { with: /\A[0-9]\z/, message: 'is invalid. Input only number' }
  end
  validates :phone_number, length: { minimum: 10, maximum: 11, message: 'is too short' }

  def save
    trading = Trading.create(item_id: item_id, user_id: user_id)
    Buyer.create(post_number: post_number, prefecture_id: prefecture_id, city: city, address: address,
                 building_name: building_name, phone_number: phone_number, trading_id: trading.id)
  end
end
