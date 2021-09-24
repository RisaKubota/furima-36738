FactoryBot.define do
  factory :item do

    sellername  {'test'}
    description  {'test_test'}
    price  {9999}
    category_id  {1}
    condition_id  {1}
    fee_id  {1}
    prefecture_id  {1}
    shippingdate_id  {1}

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
