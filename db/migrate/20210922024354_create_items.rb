class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.references :user, foreign_key: true
      t.integer :price, null: false
      t.string :sellername, null: false
      t.text :description, null: false
      t.integer :category_id, null: false
      t.integer :condition_id, null: false
      t.integer :fee_id, null: false
      t.integer :prefecture_id
      t.integer :shippingdate_id
      t.timestamps
    end
  end
end
