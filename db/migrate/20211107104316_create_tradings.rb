class CreateTradings < ActiveRecord::Migration[6.0]
  def change
    create_table :tradings do |t|

      t.timestamps
    end
  end
end
