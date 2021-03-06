class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :fee
  belongs_to :prefecture
  belongs_to :shippingdate

  belongs_to :user
  has_one_attached :image
  has_one :order

  with_options presence: true do
    validates :image
    validates :sellername, length: { maximum: 40 }
    validates :description, length: { maximum: 1000 }
    validates :price, numericality: { with: /\A[0-9]+\z/, message: "is invalid. Input half-width characters" }
    validates :price, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "is out of setting range" }
  end
    validates :category_id, numericality: { other_than: 0 , message: "can't be blank"}
    validates :condition_id, numericality: { other_than: 0 , message: "can't be blank"}
    validates :fee_id, numericality: { other_than: 0 , message: "can't be blank"}
    validates :prefecture_id, numericality: { other_than: 0 , message: "can't be blank"}
    validates :shippingdate_id, numericality: { other_than: 0 , message: "can't be blank"}
end