FactoryBot.define do
  factory :order_shipping do
    postalcode {'784-0004'}
    prefecture_id {39}
    municipalities {'安芸市本町'}
    housenum {'7-3-7'}
    building {'フォルム本町'}
    tel {'09024140134'}
    token {'tok_abcdefghijk00000000000000000'}
    # association :user
    # association :item
  end
end
