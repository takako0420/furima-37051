class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  # item バリデーション
  with_options presence: true do
    validates :image
    validates :item_name
    validates :text
    validates :price, numericality: {
      with: /\A[0-9]+\z/, 
      message: 'is invalid. Input half-width characters' }
  end
  
  validates :price, numericality: {
    greater_than_or_equal_to: 300,less_than_or_equal_to: 9_999_999,
    message: 'Out of setting range'}
  
    # ActiveHash バリデーション
  with_options presence: true do
    with_options numericality: {
      other_than: 1, 
      message: "can't be blank"} do
      validates :category_id
      validates :condition_id
      validates :prefecture_id
      validates :shipping_date_id
      validates :shipping_fee_id
    end
  end

  # アソシエーション
  belongs_to :user
  has_one_attached :image
  belongs_to :category
  belongs_to :condition
  belongs_to :prefecture
  belongs_to :shipping_date
  belongs_to :shipping_fee
end
