FactoryBot.define do
  factory :item do
    association :user
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/198940.jpg'), filename: 'flag.png')
    end
    item_name         {'商品名'}
    explanation       {'商品説明'}
    category_id       {2}
    condition_id      {2}
    shipping_id       {2}
    prefecture_id     {2}
    delivery_id       {2}
    item_price        {10000}
  end
end