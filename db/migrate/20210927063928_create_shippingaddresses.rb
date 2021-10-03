class CreateShippingaddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :shippingaddresses do |t|
      t.references :order, null: false, foreign_key: true
      t.string :postalcode, null: false
      t.integer :prefecture_id, null: false
      t.string :municipalities, null: false
      t.string :housenum, null: false
      t.string :building
      t.string :tel, null: false
      t.timestamps
    end
  end
end
