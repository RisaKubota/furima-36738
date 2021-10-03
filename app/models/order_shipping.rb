class OrderShipping
  include ActiveModel::Model
  attr_accessor :postalcode, :municipalities, :housenum, :building, :tel, :prefecture_id, :item_id, :user_id, :token
  with_options presence: true do
    validates :postalcode, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :municipalities
    validates :housenum
    validates :tel, format: { with: /\A[0-9]{10,11}\z/, message: 'is invalid' }
    validates :user_id
    validates :item_id
    validates :token
  end
  validates :prefecture_id, numericality: { other_than: 0 , message: "can't be blank"}

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Shippingaddress.create(postalcode: postalcode, municipalities: municipalities, housenum: housenum, building: building, tel: tel, prefecture_id: prefecture_id, order_id: order.id)
  end
end
