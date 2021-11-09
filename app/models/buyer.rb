class Buyer < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :trading
  belongs_to :prefecture
end
