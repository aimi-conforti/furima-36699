FactoryBot.define do
  factory :item do
    user                  {'test1'}
    image                 {'arrow_top.png'}
    new_items             {'商品'}
    items_explain         {'新商品'}
    category_id           {'メンズ'}
    sales_status_id       {'新品・未使用'}
    postage_id            {'着払い（購入者負担）'}
    prefecture_id         {'北海道'}
    shipping_date_id      {'1~2日で発送'}
    sell_price            {300}
  end
end
