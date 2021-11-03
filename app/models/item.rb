class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

# item バリデーション
  with_options presence: true do
    validates :user_id
    validates :item_name
    validates :price, numericality: {
      only_integer: true, greater_than_or_equal_to: 300,
       less_than_or_equal_to: 9999999}
    validates :text
    validates :image
  end

# ActiveHash バリデーション
  with_options numericality: {
    other_than: 1, message: "can't be blank"} do
    validates :category_id
    validates :condition_id
    validates :prefecture_id
    validates :shipping_date_id
    validates :shipping_fee_id
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

