class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.references :user, foreign_key: true
      t.string     :item_name
      t.integer    :price
      t.text       :text
      t.integer    :category_id
      t.integer    :condition_id
      t.integer    :shipping_fee_id
      t.integer	   :prefecture_id
      t.integer    :shipping_date_id	
      t.timestamps
    end
  end
end
