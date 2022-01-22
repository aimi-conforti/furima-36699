FactoryBot.define do
  factory :item do
    new_items             {'商品'}
    items_explain         {'新商品'}
    category_id           {2}
    sales_status_id       {2}
    postage_id            {2}
    prefecture_id         {2}
    shipping_date_id      {2}
    sell_price            {300}
    
    association :user
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
