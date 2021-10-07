class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :post_code,         null: false
      t.integer :send_area_id,     null: false
      t.string :city,              null: false
      t.string :city_address,      null: false
      t.string :prefecture_id,     null: false
      t.string :building_name
      t.string :phone_number,      null: false
      t.references :buy_item ,     null: false, foreign_key: true
      t.timestamps
    end
  end
end
