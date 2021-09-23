class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :fee
  belongs_to :prefecture
  belongs_to :shippingdate
  has_one_attached :image

  with_options presence: true do
    validates :user_id
    validates :price
    validates :description
    validates :sellername
  end

    validates :category_id, numericality: { other_than: 1 , message: "Category can't be blank"}
    validates :condition_id, numericality: { other_than: 1 , message: "Condition can't be blank"}
    validates :fee_id, numericality: { other_than: 1 , message: "Fee can't be blank"}
    validates :prefecture_id, numericality: { other_than: 1 , message: "Prefecture can't be blank"}
    validates :shippingdate_id, numericality: { other_than: 1 , message: "Shippingdate can't be blank"}

end
